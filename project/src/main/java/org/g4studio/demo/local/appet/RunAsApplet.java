package org.g4studio.demo.local.appet;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.swing.JApplet;
import javax.swing.JButton;

public class RunAsApplet extends JApplet {

	public RunAsApplet() {
		getContentPane().setLayout(null);
		JButton button = new JButton("call servlet");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// String result = "";
				try {
					String result = "";
					URL httpurl = new URL("http://127.0.0.1:8899/g4studio/myServlet?username=Lily");
					HttpURLConnection httpConn = (HttpURLConnection) httpurl.openConnection();
					httpConn.setDoOutput(true);
					httpConn.setDoInput(true);
					httpConn.connect();
					BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
					String line;
					while ((line = in.readLine()) != null) {
						result += line;
					}
					in.close();
					System.out.println(result);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}

		});
		button.setBounds(47, 67, 104, 23);
		getContentPane().add(button);

	}
}
