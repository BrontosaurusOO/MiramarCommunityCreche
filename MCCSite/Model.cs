using System;
using System.Collections;

class Testimonal
{
    public string Text { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }
    
    public Testimonal(string text, string name, DateTime date)
    {
        Text = text;
        Name = name;
        Date = date;
    }
}

class TestimonalComparer : IComparer
{
    public int Compare(object x, object y)
    {
        Testimonal testX = x as Testimonal;
        Testimonal testY = y as Testimonal;

        return testY.Date.CompareTo(testX.Date);
    }
}

class Event
{
    public string Title { get; set; }
    public string Description { get; set; }
    public int Days { get; set; }
    public DateTime Date { get; set; }

    public Event(string title, string desc, int days, DateTime date)
    {
        Title = title;
        Description = desc;
        Days = days;
        Date = date;
    }
   
}


class EventComparer : IComparer
{
    public int Compare(object x, object y)
    {
        Event eventX = x as Event;
        Event eventY = y as Event;

        return eventY.Date.CompareTo(eventX.Date);
    }
}

class News
{
    public string Description { get; set; }
    public string Title { get; set; }
    public DateTime Date { get; set; }

    public News(string title, string desc, DateTime date)
    {
        Description = desc;
        Title = title;
        Date = date;
    }
}

class NewsComparer : IComparer
{
    public int Compare(object x, object y)
    {
        News newsX = x as News;
        News newsY = y as News;

        return newsY.Date.CompareTo(newsX.Date);
    }
}