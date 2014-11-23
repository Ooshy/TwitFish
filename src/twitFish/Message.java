package twitFish;

import java.util.Date;

public class Message
{
	boolean _isDirect;
	String _text;
	Date _date;
	User _author;

	public Message(String text, Date date, User author)
	{
		this(text,date, author,false);
	}
	public Message(String text, User author)
	{
		this(text,author,false);
	}
	
	public Message(String text, Date date, User author, boolean isDirect)
	{
		_text = text;
		_date = date;
		_author = author;
		_isDirect = isDirect;
	}
	
	public Message(String text, User author, boolean isDirect)
	{
		_text = text;
		_date = new Date();
		_author = author;
		_isDirect = isDirect;
	}

	public String getText()
	{
		return _text;
	}
	public User getAuthor()
	{
		return _author;
	}
	public Date getDate()
	{
		return _date;
	}
	public boolean isDirect()
	{
		return _isDirect;
	}
}