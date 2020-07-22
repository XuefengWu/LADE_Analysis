package me.analysis.pl.sequence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PLProcedureSequence {

    private String pkg;
    private String name;
    private String typ;
    private int  stopLine;
    private int  startLine;
    private List<Step> steps = new ArrayList<>();

    public Step createStep(String seq, String callType, String name, int size,int line,List<String> fields) {
        return new Step(seq, callType,name,size,line,fields);
    }
    public Step createStep(String seq, String callType, String name, int size,int line) {
        return new Step(seq, callType,name,size,line);
    }

    public class Step {

        private String seq;
        private String callType; //For,If,Loop,Forall,Case
        private String name;//procedureName,functionName,tableName
        private int size;
        private List<String> fields;
        private int line;

        public Step(String seq, String callType, String name, int size,int line,List<String> fields) {
            this.seq = seq;
            this.callType = callType;
            this.name = name.toUpperCase();
            this.size = size;
            this.line = line;
            this.fields = fields;
        }

        public Step(String seq, String callType, String name, int size,int line) {
            this.seq = seq;
            this.callType = callType;
            this.name = name.toUpperCase();
            this.size = size;
            this.line = line;
            this.fields = new ArrayList<>();
        }

        public String getSeq() {
            return seq;
        }

        public String getCallType() {
            return callType;
        }

        public String getName() {
            String[] ss = name.split("\\.");
            if(ss.length > 1) {
               return ss[1];
            }
            return name;
        }
        public String getProcedureFullName() {
            String[] ss = name.split("\\.");
            if(ss.length > 1) {
                return name;
            }
            return getPkg() +"."+ name;
        }
        public String getControllerFullName() {
            return PLProcedureSequence.this.getName() + "." + getName() + "." + getLine();
        }

        public int getSize() {
            return size;
        }

        public String getFields() {
            return Arrays.deepToString(fields.toArray());
        }

        public int getLine() {
            return line;
        }


        //Control
        public static final String IF = "If";
        public static final String THEN = "Then";
        public static final String ELSE = "Else";
        public static final String ELSE_IF = "ElseIf";
        public static final String LOOP = "Loop";
        public static final String FOREACH = "Foreach";
        public static final String CASE = "Case";

        //Call type
        public static final String EXECUTE = "Execute";
        public static final String CALL = "Call";

        public static final String READ = "Read";
        public static final String UPDATE = "Update";
        public static final String INSERT = "Insert";
        public static final String DELETE = "Delete";

        public static final int CASE_TABLE = 1;
        public static final int CASE_PROCEDURE = 2;
        public static final int CASE_CONTROL = 3;

        public int getCallCase() {
            if("Execute" == getCallType()) {
                return CASE_CONTROL;
            } else if("Call" == getCallType()) {
                return CASE_PROCEDURE;
            } else {
                return CASE_TABLE;
            }
        }

        @Override
        public String toString() {
            return "Step{" +
                    "seq=" + seq +
                    ", callType='" + callType + '\'' +
                    ", name='" + name + '\'' +
                    ", size=" + size +
                    ", line=" + line +
                    "}\n";
        }
    }

    public String getFullName() {
        return getPkg() + "." + getName();
    }
    public String getPkg() {
        return pkg;
    }

    public void setPkg(String pkg) {
        this.pkg = pkg.toUpperCase();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name.toUpperCase();
    }

    public String getTyp() {
        return typ;
    }

    public void setType(String typ) {
        this.typ = typ;
    }

    public int getStopLine() {
        return stopLine;
    }

    public void setStopLine(int stopLine) {
        this.stopLine = stopLine;
    }

    public int getStartLine() {
        return startLine;
    }

    public void setStartLine(int startLine) {
        this.startLine = startLine;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void addStep(Step step) {
        this.steps.add(step);
    }

    @Override
    public String toString() {
        return "PLProcedureSequence{" +
                "pkg='" + pkg + '\'' +
                ", name='" + name + '\'' +
                ", typ='" + typ + '\'' +
                ", steps=\n" + steps +
                "\n}";
    }
}
