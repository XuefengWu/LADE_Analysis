package me.analysis.pl.view;

import me.analysis.pl.generated.PlSqlBaseVisitor;
import me.analysis.pl.generated.PlSqlParser;

import java.util.Arrays;
import java.util.List;

public class PLViewVisitor extends PlSqlBaseVisitor<Void> {

    private int count = 0;
    private List<PLView> views;
    private PLView view;
    public PLViewVisitor(List<PLView> views){
        this.views = views;
    }

    @Override
    public Void visitUnit_statement(PlSqlParser.Unit_statementContext ctx) {
        System.out.println(++count + " : " + ctx.getText() + "   " + views.size());

        if (ctx.children != null && ctx.children.size() == 6) {
            System.out.println("VIEW: "+getViewName(ctx));
            view = new PLView();
            views.add(view);
            view.setPrj(getPrjName(ctx));
            view.setView(getViewName(ctx));
        } else if (ctx.children != null && view.getTargetColumns().isEmpty()) {
            String[] columns = getTargetColumns(ctx);
            view.setTargetColumns(Arrays.asList(columns));
        }
        return super.visitUnit_statement(ctx);
    }

    private String[] getTargetColumns(PlSqlParser.Unit_statementContext ctx) {
        String ss = ctx.getText().replaceAll("\\(","").replaceAll("\\)","").replaceAll("\"","");
        return ss.split(",");
    }
    private String getPrjName(PlSqlParser.Unit_statementContext ctx){
        return (ctx.children.get(3).getText()).replaceAll("\"","");
    }
    private String getViewName(PlSqlParser.Unit_statementContext ctx) {
        return (ctx.children.get(5).getText()).replaceAll("\"","");
    }

    @Override
    public Void visitTableview_name(PlSqlParser.Tableview_nameContext ctx) {
        view.addSourceTable(ctx.getText().toUpperCase().replaceAll("'",""));
        return super.visitTableview_name(ctx);
    }

    @Override
    public Void visitSelected_element(PlSqlParser.Selected_elementContext ctx) {
        //System.out.println("Source Column : "+ctx.getText());
        view.addSourceColumn(ctx.getText());
        return super.visitSelected_element(ctx);
    }

}
