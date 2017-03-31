/**
 *   ProfileViewer - graphically displays java.prof output
 *   Copyright (C) 1999  Greg White
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

public class SortDialog extends JDialog {

	ProfileViewer parent;
	JComboBox whoChoice, howChoice, orderChoice;
	JButton ok, close;

	SortDialog (ProfileViewer parent, ESortWho who, ESortHow how, boolean ascending) {
		super(parent, "Set sort method", true);
		this.parent = parent;
		createGui();
		setChoices(who, how, ascending);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		addKeyListener(new KeyAdapter() {
			public void keyPressed (KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ESCAPE) setVisible(false); } });
	}

	public boolean getAscending() {
		return (orderChoice.getSelectedIndex() == 0);
	}

	public ESortWho getWho() {
		return ESortWho.fromString((String) whoChoice.getSelectedItem());
	}

	public ESortHow getHow() {
		return ESortHow.fromString((String) howChoice.getSelectedItem());
	}

	private void createGui() {
		whoChoice = new JComboBox();
		whoChoice.addItem(ESortWho.METHODS.toName());
		whoChoice.addItem(ESortWho.CALLEES.toName());
		whoChoice.addItem(ESortWho.CALLERS.toName());
		whoChoice.addItem(ESortWho.ALL.toName());
		whoChoice.setMaximumRowCount(whoChoice.getItemCount());
		JLabel whoLabel = new JLabel("Sort What:");
		howChoice = new JComboBox();
		howChoice.addItem(ESortHow.TIME.toName());
		howChoice.addItem(ESortHow.NAME.toName());
		howChoice.addItem(ESortHow.CALLS.toName());
		howChoice.setMaximumRowCount(howChoice.getItemCount());
		JLabel howLabel = new JLabel("Sort By:");
		orderChoice = new JComboBox();
		orderChoice.addItem("Ascending");
		orderChoice.addItem("Descending");
		orderChoice.setMaximumRowCount(orderChoice.getItemCount());
		JLabel orderLabel = new JLabel("Sort Order:");
		JPanel values = new JPanel();
		values.setLayout(new GridLayout(2, 3));
		values.add(whoLabel);
		values.add(howLabel);
		values.add(orderLabel);
		values.add(whoChoice);
		values.add(howChoice);
		values.add(orderChoice);

		JPanel btns = new JPanel();
		btns.setLayout(new BoxLayout(btns, BoxLayout.X_AXIS));
		ok = new JButton("OK");
		ok.addActionListener(new ActionListener() {
			public void actionPerformed (ActionEvent e) { action(); } });
		close = new JButton("Cancel");
		close.addActionListener(new ActionListener() {
			public void actionPerformed (ActionEvent e) { setVisible(false); } });
		btns.add(Box.createHorizontalGlue());
		btns.add(ok);
		btns.add(Box.createHorizontalGlue());
		btns.add(close);
		btns.add(Box.createHorizontalGlue());
		getContentPane().setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
		getContentPane().add(values);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		getContentPane().add(btns);
		getContentPane().add(Box.createRigidArea(new Dimension(0, 10)));
		pack();
		setSize(getPreferredSize());
		setLocationRelativeTo(parent);
	}

	private void setChoices (ESortWho who, ESortHow how, boolean ascending) {
		whoChoice.setSelectedItem(who.toName());
		howChoice.setSelectedItem(how.toName());
		if (ascending) {
			orderChoice.setSelectedIndex(1);
			return;
		} else {
			orderChoice.setSelectedIndex(0);
			return;
		}
	}

	public void action() {
		setVisible(false);
		ESortWho who = getWho();
		ESortHow how = getHow();
		boolean ascending = getAscending();
		if (who == ESortWho.METHODS || who == ESortWho.ALL)
			parent.sortMethods(how, ascending);
		if (who == ESortWho.CALLEES || who == ESortWho.ALL)
			parent.setCalleeSort(how, ascending);
		if (who == ESortWho.CALLERS || who == ESortWho.ALL)
			parent.setCallerSort(how, ascending);
		setVisible(false);
		parent.requestFocus();
	}
}

