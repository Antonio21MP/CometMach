/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cometmach;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;

/**
 *
 * @author Antonio Perdomo
 */

public class CometMach {
    static CometMachParser sintactic;
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException, Exception {
        // TODO code application logic here
        System.out.println("----------------COMETMACH---------------");
        File file;
        file = new File("C:\\Users\\Antonio Perdomo\\Documents\\Compiladores I\\Cometmach\\src\\cometmach\\test3.txt");
        Reader reader = new InputStreamReader(new FileInputStream(file));
        //System.out.println(reader.read());
        CometMachLexical Lexical = new CometMachLexical(reader);
        sintactic = new CometMachParser(Lexical);
        
        try {
           sintactic.parse();
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
        if(sintactic != null){
            if(sintactic.root != null){
                ArrayList<Node> childs = sintactic.root.getChilds();
                System.out.println("Padre:"+sintactic.root.getName());
                for (Node child : childs) {
                    System.out.println("P1: "+child.getName()+ " " +child.getNodeNum());
                    for (Node child1 : child.getChilds()) {
                        System.out.println("P2: "+child1.getName() + " " +child1.getNodeNum());
                        for (Node child2 : child1.getChilds()) {
                            System.out.println("P3: "+child2.getName()+ " "+ child2.getNodeNum() + " Content: " +child2.getValue());
                            for (Node child3 : child2.getChilds()) {
                                System.out.println("P4: "+child3.getName()+ " "+ child3.getNodeNum() + " Content: " +child3.getValue());
                                for (Node child4 : child3.getChilds()) {
                                System.out.println("P5: "+child4.getName()+ " "+ child4.getNodeNum() + " Content: " +child4.getValue());
                                }
                            }
                                
                        }
                    }
                }
            }else{
                System.out.println("No hay nada en padre");
            }
        }
    }
}
