package com.sds.view.board;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.sds.model.board.BoardDAO;

public class writeForm extends JFrame{
	
	JTextField t_writer,t_title;
	JTextArea area;
	JButton bt;
	
	public writeForm() {
		setLayout(new FlowLayout());
		t_writer=new JTextField(30);
		t_title=new JTextField(30);
		area=new JTextArea(5,30);
		bt=new JButton("등록");
		
		add(t_writer);
		add(t_title);
		add(area);
		add(bt);
		
		bt.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				BoardDAO boardDAO=new BoardDAO();
				int result=boardDAO.insert(t_writer.getText(), t_title.getText(), area.getText());
				if(result!=0){
					JOptionPane.showMessageDialog(getParent(), "입력성공");
				}else{
					JOptionPane.showMessageDialog(getParent(), "입력실패");
				}
			}
		});
		
		setVisible(true);
		setSize(400, 600);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	
	public static void main(String[] args) {
		new writeForm();

	}

}
