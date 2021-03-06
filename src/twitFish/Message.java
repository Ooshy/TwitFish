package twitFish;

import java.util.Date;

public class Message
{
	Integer _id;
	boolean _isPublic;
	String _text;
	Date _date;
	User _author;

	public Message(Integer id, String text, Date date, User author)
	{
		this(id, text,date, author,false);
	}
	public Message(Integer id, String text, User author)
	{
		this(id, text,author,false);
	}
	
	public Message(Integer id, String text, Date date, User author, boolean isPublic)
	{
		_id = id;
		_text = text;
		_date = date;
		_author = author;
		_isPublic = isPublic;
	}
	
	public Message(Integer id, String text, User author, boolean isPublic)
	{
		_id = id;
		_text = text;
		_date = new Date();
		_author = author;
		_isPublic = isPublic;
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
	public boolean isPublic()
	{
		return _isPublic;
	}
	public Integer getId()
	{
		return _id;
	}
}