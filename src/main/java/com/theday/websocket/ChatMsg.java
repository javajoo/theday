package com.theday.websocket;

public class ChatMsg {

	private String cmd;
	private String msg;
	private String chatName;
	private String id;

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getChatName() {
		return chatName;
	}

	public void setChatName(String chatName) {
		this.chatName = chatName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ChatMsg [cmd=" + cmd + ", msg=" + msg + ", chatName=" + chatName + ", id=" + id + "]";
	}

}
