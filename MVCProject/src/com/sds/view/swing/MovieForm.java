package com.sds.view.swing;

import java.awt.Choice;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import com.sds.mvc.model.MovieAdvice;

public class MovieForm extends JFrame{
	Choice ch;
	JButton bt;
	//HttpURLConnection con;
	//URL url;//������ �����ϴ� �ڿ��� ��ġ  (uniform resource locator)
	public MovieForm(){
		setLayout(new FlowLayout());
		ch=new Choice();
		ch.add("�ú���");
		ch.add("��Ű");
		ch.add("�λ���");
		ch.add("���丣��");
		bt=new JButton("����");
		bt.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				getResult();	
			}
		});
		add(ch);
		add(bt);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(600, 800);
		setVisible(true);
		
	}
	
	public void getResult(){
		//�Ʒ��� �� ��ü�� ��ο��� ��밡���� �߸��� �ڵ��̴�.
		MovieAdvice movieAdvice=new MovieAdvice();
		String msg=movieAdvice.getAdvice(ch.getSelectedItem());
		JOptionPane.showMessageDialog(this, msg);
	}
	public static void main(String[] args) {
		
		new MovieForm();
	}
}
