/*
Minetest
Copyright (C) 2014-2019 MoNTE48, Maksim Gamarnik <MoNTE48@mail.ua>
Copyright (C) 2014-2019 ubulem,  Bektur Mambetov <berkut87@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

package net.minetest.minetest;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.KeyEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import java.util.Objects;

public class MinetestTextEntry extends AppCompatActivity {
	private androidx.appcompat.app.AlertDialog mTextInputDialog;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Bundle b = getIntent().getExtras();
		int editType = Objects.requireNonNull(b).getInt("editType");
		String hint = b.getString("hint");
		String current = b.getString("current");
		final AlertDialog.Builder builder = new AlertDialog.Builder(this);
		EditText mTextInputWidget = new EditText(this);
		builder.setView(mTextInputWidget);
		mTextInputWidget.requestFocus();
		mTextInputWidget.setHint(hint);
		mTextInputWidget.setText(current);
		final InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
		Objects.requireNonNull(imm).toggleSoftInput(InputMethodManager.SHOW_FORCED, InputMethodManager.HIDE_IMPLICIT_ONLY);
		if (editType == 3)
			mTextInputWidget.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
		else
			mTextInputWidget.setInputType(InputType.TYPE_CLASS_TEXT);
		mTextInputWidget.setOnKeyListener((view, KeyCode, event) -> {
			if (KeyCode == KeyEvent.KEYCODE_ENTER) {
				imm.hideSoftInputFromWindow(mTextInputWidget.getWindowToken(), 0);
				pushResult(mTextInputWidget.getText().toString());
				return true;
			}
			return false;
		});
		mTextInputDialog = builder.create();
		if (!isFinishing())
			mTextInputDialog.show();
		mTextInputDialog.setOnCancelListener(dialog -> {
			pushResult(mTextInputWidget.getText().toString());
			setResult(Activity.RESULT_CANCELED);
			mTextInputDialog.dismiss();
			finish();
		});
	}

	private void pushResult(String text) {
		Intent resultData = new Intent();
		resultData.putExtra("text", text);
		setResult(AppCompatActivity.RESULT_OK, resultData);
		mTextInputDialog.dismiss();
		finish();
	}
}
