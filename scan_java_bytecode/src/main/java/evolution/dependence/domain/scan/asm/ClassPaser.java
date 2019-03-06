package evolution.dependence.domain.scan.asm;

import evolution.dependence.domain.models.JClass;
import evolution.dependence.domain.models.JMethod;
import org.objectweb.asm.Attribute;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.Type;
import org.objectweb.asm.tree.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.ListIterator;
import java.util.stream.Collectors;

public class ClassPaser {

    public JClass visitClass(Path path) throws IOException {
        long start = System.currentTimeMillis();
        FileInputStream is = new FileInputStream(path.toFile());
        ClassNode classNode = new ClassNode();
        ClassReader cr = new ClassReader(is);
        cr.accept(classNode, 0);
        is.close();

        JClass clz = new JClass();
        clz.setName(classNode.name);

        for (FieldNode f : classNode.fields) {
            clz.addDependence(Type.getType(f.desc).getInternalName());
            clz.addField(f.name,Type.getType(f.desc).getInternalName());
        }
        for(String intf:classNode.interfaces){
            clz.addParent(intf);
        }
        clz.addParent(classNode.superName);

        for (MethodNode m : classNode.methods) {
            JMethod method = new JMethod(m.name, clz.getName());
            method.setAccess(m.access);
            Type t = Type.getType(m.desc);
            method.setReturnType(t.getReturnType().getInternalName());
            clz.addDependence(t.getReturnType().getInternalName());
            if (m.parameters != null) {
                for (ParameterNode p : m.parameters) {
                    clz.addDependence(p.name);
                }
            }
            if (m.attrs != null) {
                for (Attribute a : m.attrs) {
                    clz.addDependence(a.type);
                }
            }
            if (m.exceptions != null) {
                for (String e : m.exceptions) {
                    clz.addDependence(e);
                }
            }
            if (m.localVariables != null) {
                for (LocalVariableNode v : m.localVariables) {
                    Type t2 = Type.getType(v.desc);
                    clz.addDependence(t2.getInternalName());
                }
            }
            InsnList instructions = m.instructions;
            ListIterator<AbstractInsnNode> instIterator = instructions.iterator();
            while (instIterator.hasNext()) {
                AbstractInsnNode inst = instIterator.next();
                if (inst instanceof MethodInsnNode) {
                    MethodInsnNode methodInsn = (MethodInsnNode) inst;
                    JMethod _m = new JMethod(methodInsn.name, refineMethodOwner(methodInsn.name,methodInsn.owner,classNode));
                    _m.setAccess(0x0001);
                    method.addCall(_m);
                }
            }

            clz.addMethod(method);
        }

        long stop = System.currentTimeMillis();
        //System.out.println("parse " + path + " spend: " + (stop-start)/1000);
        return clz;
    }

    private String refineMethodOwner(String method, String owner,ClassNode classNode) {
        if(classNode.name.equalsIgnoreCase(owner)) {
            List<String> methodNameList = classNode.methods.stream().map(v -> v.name).collect(Collectors.toList());
            if (methodNameList.contains(method)) {
                return owner;
            } else {
                return classNode.superName;
            }
        } else {
            return owner;
        }
    }
}
