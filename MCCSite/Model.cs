using System;
using System.Collections;

public class Review
{
    public int Id { get; set; }
    public string Text { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }

    public Review(int eyeD, string text, string name, DateTime date)
    {
        Id = eyeD;
        Text = text;
        Name = name;
        Date = date;
    }
}

public class ReviewComparer : IComparer
{
    public int Compare(object x, object y)
    {
        Review testX = x as Review;
        Review testY = y as Review;

        return testY.Date.CompareTo(testX.Date);
    }
}

public class EventItem
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public int Days { get; set; }
    public DateTime Date { get; set; }

    public EventItem(int eyeD, string title, string desc, int days, DateTime date)
    {
        Id = eyeD;
        Title = title;
        Description = desc;
        Days = days;
        Date = date;
    }

}


public class EventComparer : IComparer
{
    public int Compare(object x, object y)
    {
        EventItem eventX = x as EventItem;
        EventItem eventY = y as EventItem;

        return eventY.Date.CompareTo(eventX.Date);
    }
}

public class NewsItem
{
    public int Id { get; set; }
    public string Description { get; set; }
    public string Title { get; set; }
    public DateTime Date { get; set; }

    public NewsItem(int eyeD, string title, string desc, DateTime date)
    {
        Id = eyeD;
        Description = desc;
        Title = title;
        Date = date;
    }
}

public class NewsComparer : IComparer
{
    public int Compare(object x, object y)
    {
        NewsItem newsX = x as NewsItem;
        NewsItem newsY = y as NewsItem;

        return newsY.Date.CompareTo(newsX.Date);
    }
}

public class PhotoItem
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Caption { get; set; }
    public string Folder { get; set; }
    public string Height { get; set; }
    public string Width { get; set; }
    public DateTime Date { get; set; }

    public enum PhotoFolders
    {
        Event = 0,
        Trips = 1,
        Guest = 2,
        Inside = 3,
        Outside = 4,
        Themed = 5
    }

    public PhotoItem(int eyeD, string f, string name, string desc, string w, string h, DateTime d)
    {
        Id = eyeD;
        Name = name;
        Caption = desc;
        Folder = f;
        Height = h;
        Width = w;
        Date = d;
    }

    public PhotoItem(int eyeD, string f, string name, string desc, DateTime d)
    {
        Id = eyeD;
        Name = name;
        Caption = desc;
        Folder = f;
        Date = d;
    }
}

public class PhotoItemComparer : IComparer
{
    public int Compare(object x, object y)
    {
        PhotoItem photoX = x as PhotoItem;
        PhotoItem photoY = y as PhotoItem;

        return photoY.Date.CompareTo(photoX.Date);
    }
}