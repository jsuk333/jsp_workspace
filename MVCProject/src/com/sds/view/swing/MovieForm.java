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
	//URL url;//서버상에 존재하는 자원의 위치  (uniform resource locator)
	public MovieForm(){
		setLayout(new FlowLayout());
		ch=new Choice();
		ch.add("시빌워");
		ch.add("럭키");
		ch.add("부산행");
		ch.add("인페르노");
		bt=new JButton("선택");
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
		//아래의 모델 객체는 모두에서 사용가능한 중립적 코드이다.
		MovieAdvice movieAdvice=new MovieAdvice();
		String msg=movieAdvice.getAdvice(ch.getSelectedItem());
		JOptionPane.showMessageDialog(this, msg);
	}
	public static void main(String[] args) {
		
		new MovieForm();
	}
}
