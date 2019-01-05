package evolution.dependence.domain.models;

public class JField {
    private String name;
    private String type;

    public JField(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }
}
