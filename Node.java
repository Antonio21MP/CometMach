/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cometmach;

import java.util.ArrayList;

/**
 *
 * @author Antonio Perdomo
 */
public class Node {
  private String name;
  private ArrayList<Node> childs;
  private String value;
  private int nodeNum;
  
  public Node(String name){
      setName(name);
      childs = new ArrayList<>();
      setNodeNum(0);
      setValue(" ");
  }
    
    public void addChild(Node child){
        childs.add(child);   
    }
    
    public String getName(){
        return name;   
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public ArrayList<Node> getChilds(){
        return childs;
    }
    
    public void setChilds(ArrayList<Node> childs){
        this.childs = childs;
    }
    
    public int getNodeNum(){
        return nodeNum;
    }
    
    public void setNodeNum(int nodeNum) {
        this.nodeNum = nodeNum;
    }

    public void setValue(String value) {
        this.value = value;
    }
    public String getValue() {
        return value;
    }
}

