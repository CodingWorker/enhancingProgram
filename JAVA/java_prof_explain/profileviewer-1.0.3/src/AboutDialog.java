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
import javax.swing.*;

public class AboutDialog extends JDialog {

	ProfileViewer parent;
	JButton close;

	AboutDialog (ProfileViewer parent) {
		super(parent, "About ProfileViewer " + parent.VERSION, true);
		this.parent = parent;
		createGui_();
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		addKeyListener(new KeyAdapter() {
			public void keyPressed (KeyEvent e) {
				int key = e.getKeyCode();
				if ((key == KeyEvent.VK_ENTER) || (key == KeyEvent.VK_ESCAPE))
					setVisible(false);
			}
		});
	}

	private void createGui_() {
		Font myFont = new Font("Times", Font.PLAIN, 18);
		JLabel authorLabel = new JLabel("Created by Greg White");
		authorLabel.setFont(myFont);
		authorLabel.setAlignmentX(CENTER_ALIGNMENT);
		JLabel ulf1Label = new JLabel("Further work by Ulf Dittmer");
		ulf1Label.setFont(myFont);
		ulf1Label.setAlignmentX(CENTER_ALIGNMENT);
		JLabel ulf2Label = new JLabel("http://www.ulfdittmer.com/");
		ulf2Label.setFont(myFont);
		ulf2Label.setAlignmentX(CENTER_ALIGNMENT);
		JLabel other = new JLabel("  With contributions by many more!  ");
		other.setFont(myFont);
		other.setAlignmentX(CENTER_ALIGNMENT);

		JPanel myBox = new JPanel();
		myBox.setLayout(new BoxLayout(myBox, BoxLayout.Y_AXIS));
		myBox.add(Box.createRigidArea(new Dimension(0,10)));
		myBox.add(authorLabel);
		myBox.add(Box.createRigidArea(new Dimension(0,10)));
		myBox.add(ulf1Label);
		myBox.add(ulf2Label);
		myBox.add(Box.createRigidArea(new Dimension(0,10)));
		myBox.add(other);
		myBox.add(Box.createRigidArea(new Dimension(0,10)));

		close = new JButton("Close");
		close.addActionListener(new ActionListener() {
			public void actionPerformed (ActionEvent e) { setVisible(false); } });
		close.setAlignmentX(CENTER_ALIGNMENT);
		myBox.add(close);
		myBox.add(Box.createRigidArea(new Dimension(0,10)));
		getContentPane().add(myBox);
		pack();
		setSize(getPreferredSize());
		setLocationRelativeTo(parent);
	}

}
