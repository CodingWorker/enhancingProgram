/**
 *   ProfileViewer - graphically displays java.prof output
 *
 *   Copyright (C) 1999-2009  Ulf Dittmer
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

import java.awt.*;
import java.awt.event.*;
import java.io.IOException;
import java.net.URL;
import java.net.MalformedURLException;
import javax.swing.*;
import javax.swing.event.*;

public class HelpDialog extends JDialog {

	ProfileViewer parent;
	JButton close;

	HelpDialog (ProfileViewer parent) {
		super(parent, "ProfileViewer Help", true);
		this.parent = parent;
		createGui();
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		addKeyListener(new KeyAdapter() {
			public void keyPressed (KeyEvent e) {
				int key = e.getKeyCode();
				if ((key == KeyEvent.VK_ENTER) || (key == KeyEvent.VK_ESCAPE))
					setVisible(false);
			}
		});
	}

	private void createGui () {
		JScrollPane sp = null;
        	sp = new JScrollPane();
        	JViewport vp = sp.getViewport();
        	vp.add(createEditorPane());
			vp.setScrollMode(JViewport.BACKINGSTORE_SCROLL_MODE);

		close = new JButton("Close");
		close.addActionListener(new ActionListener() {
			public void actionPerformed (ActionEvent e) { setVisible(false); } });
		close.setAlignmentX(CENTER_ALIGNMENT);

		getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
		getContentPane().add(Box.createRigidArea(new Dimension(0,10)));
		getContentPane().add(sp);
		getContentPane().add(Box.createRigidArea(new Dimension(0,10)));
		getContentPane().add(close);
		getContentPane().add(Box.createRigidArea(new Dimension(0,10)));

		pack();
//		setSize(getPreferredSize());
		setSize(500, 600);
		setLocationRelativeTo(parent);
	}

	private JEditorPane createEditorPane() {
		String urlSpec = parent.props.getProperty("ProfileViewer.helpURL");
		if (urlSpec == null) {
			urlSpec = new String("file:" + System.getProperty("user.dir")
						  + System.getProperty("file.separator") + "index.html");
		} else {
			urlSpec = "file:" + urlSpec;
		}
		JEditorPane editorPane = null;
		try {
			editorPane = new JEditorPane(new URL(urlSpec));
		} catch (Exception ex) {
			editorPane = new JEditorPane("text/plain",
					new String ("error opening " + urlSpec + ", " + ex.getMessage()));
		}
		editorPane.setEditable(false);
		return editorPane;
	}
        
}
