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

/**
 *
 * @author Antonio Perdomo
 */
public class CometMach {

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
        new CometMachParser(Lexical).parse();
	}
    }
