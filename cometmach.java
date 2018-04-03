/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cometmach;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;

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
                Node rootc = sintactic.root;
                graph(rootc);
            }else{
                System.out.println("No hay nada en padre");
            }
        }
    }

    public static void graph(Node rootc) {
        File file;
        file = new File("C:\\Users\\Antonio Perdomo\\Documents\\Compiladores I\\Cometmach\\src\\cometmach\\tree.dot");
        FileWriter filewrite = null;
        PrintWriter pw = null;
        String chain = graphNode(rootc);
        
        try {
            filewrite = new FileWriter(file);
            pw = new PrintWriter(filewrite);
            pw.println("digraph G {");
            pw.println(chain);
            pw.println("\n}");
            filewrite.close();
        } catch (Exception e) {
            System.out.println(e + "1"); 
        }
        
        try {
            String cmd = "dot -Tpng tree.dot -o tree.png";
            Runtime.getRuntime().exec(cmd);
        } catch (Exception e) {
            System.out.println(e + "2"); 
        }
        
    }

    public static String graphNode(Node rootc) {
        String chain = "";
        for (Node child : rootc.getChilds()) {
            chain += "\""+ rootc.getNodeNum() + "_" + rootc.getName() + "="+ rootc.getValue()
                       + "\" -> \""+ child.getNodeNum() + "_" + child.getName() + "=" + child.getValue()+"\";";
            System.out.println(rootc.getNodeNum() + "_" + rootc.getName() + " = "+ rootc.getValue() +"->");
            chain += graphNode(child);
        }
        return chain;
    }
}
