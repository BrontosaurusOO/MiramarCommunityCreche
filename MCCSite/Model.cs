﻿using System;
using System.Collections;

public class Testimonal
{
    public int Id { get; set; }
    public string Text { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }

    public Testimonal(int eyeD, string text, string name, DateTime date)
    {
        Id = eyeD;
        Text = text;
        Name = name;
        Date = date;
    }
}

public class TestimonalComparer : IComparer
{
    public int Compare(object x, object y)
    {
        Testimonal testX = x as Testimonal;
        Testimonal testY = y as Testimonal;

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

public class News
{
    public int Id { get; set; }
    public string Description { get; set; }
    public string Title { get; set; }
    public DateTime Date { get; set; }

    public News(int eyeD, string title, string desc, DateTime date)
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
        News newsX = x as News;
        News newsY = y as News;

        return newsY.Date.CompareTo(newsX.Date);
    }
}

public class Photo
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
        Event,
        Trips,
        Guest,
        Inside,
        Outside,
        Themed
    }

    public Photo(int eyeD, string f, string name, string desc, string w, string h, DateTime d)
    {
        Id = eyeD;
        Name = name;
        Caption = desc;
        Folder = f;
        Height = h;
        Width = w;
        Date = d;
    }

}

public class PhotoComparer : IComparer
{
    public int Compare(object x, object y)
    {
        Photo photoX = x as Photo;
        Photo photoY = y as Photo;

        return photoY.Date.CompareTo(photoX.Date);
    }
}