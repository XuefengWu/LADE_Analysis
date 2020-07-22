package me.analysis.pl.select.model;

import java.util.Objects;
import java.util.Optional;

public class ConditionExpr {

    private Either<TableColumn,String> a;
    private Either<TableColumn,String> b;
    private String op;

    public static ConditionExpr create(Either<TableColumn,String> a, Either<TableColumn,String> b, String _op) {
        String op = _op.trim();
        if(!("=".equalsIgnoreCase(op) || "is".equalsIgnoreCase(op) || "in".equalsIgnoreCase(op)
                || ">".equalsIgnoreCase(op) || ">".equalsIgnoreCase(op) || "<>".equalsIgnoreCase(op)
                || ">".equalsIgnoreCase(op) || ">".equalsIgnoreCase(op))) {
            try {
                throw new Exception("invalidate op: " + op);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new ConditionExpr(a,b,op);
    }

    private ConditionExpr(Either<TableColumn,String> a, Either<TableColumn,String> b, String op) {
        this.a = a;
        this.b = b;
        this.op = op;
    }

    public Optional<TableColumn> getLeftTableColumn(){
        return a.getLeft();
    }
    public Optional<TableColumn> getRightTableColumn(){
        return b.getLeft();
    }

    public Either<TableColumn, String> getLeft() {
        return a;
    }

    public Either<TableColumn, String> getRight() {
        return b;
    }

    public String getOp() {
        return op;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ConditionExpr that = (ConditionExpr) o;
        return Objects.equals(a, that.a) &&
                Objects.equals(b, that.b) &&
                Objects.equals(op, that.op);
    }

    @Override
    public int hashCode() {

        return Objects.hash(a, b, op);
    }

    @Override
    public String toString() {
        return "ConditionExpr{" +
                "a=" + a +
                ", b=" + b +
                ", op='" + op + '\'' +
                '}';
    }
}
