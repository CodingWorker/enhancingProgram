package com.shiyanlou.test;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created by DaiYan on 2017/2/4.
 */
public class MySwingWindow extends JFrame{
    public static void main(String[] args){
        MySwingWindow window=new MySwingWindow();
        window.setVisible(true);
    }

    private JLabel myLabel;
    public JLabel getMyLabel(){
        if(myLabel==null){
            myLabel=new JLabel();
            myLabel.setBounds(5,10,250,30);
            myLabel.setText("this is the text of the label");
        }

        return this.myLabel;
    }

    private JTextField myTextField;
    public JTextField getMyTextField() {
        if (myTextField == null) {
            myTextField = new JTextField();
            myTextField.setBounds(5, 45, 200, 30);
            myTextField.setText("this is the text of the textField");
        }

        return this.myTextField;
    }

        private JButton myButton;
        public JButton getmyButton(){
            if(myButton==null){
                myButton=new JButton();
                myButton.setBounds(5,80,100,40);
                myButton.setText("click me");
                myButton.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        myLabel.setForeground(Color.red);
                        myTextField.setBackground(Color.blue);
                    }
                });
            }

            return this.myButton;
    }

    private JMenuBar myMenu;
    public JMenuBar getMyMenu(){
        if(this.myMenu==null){
            this.myMenu=new JMenuBar();
            this.myMenu.setBackground(Color.getColor("#acacac"));
            this.myMenu.setBounds(0,0,100,20);
            this.myMenu.add(new JMenu("aa"));
        }

        return this.myMenu;
    }

    public MySwingWindow(){
        super();
        Component com=new Button("这是一个按钮");
        this.add(this.getMyLabel(),null);
        this.add(this.getMyTextField(),null);
        this.add(this.getmyButton(),null);
        this.add(this.getMyMenu(),null);
        this.setSize(400,300);
        this.getContentPane().setLayout(null);
        this.setTitle("swing 学习 ");
    }

}