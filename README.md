# Your Success App

The purpose of this documentation is to present a concept for a new To-do list. If you would like to participate on this project, please feel free to 'Pull Request' your improvements. Also, please feel free to add any comment that can make this concept better in any way.

## Problem

I believe that most To-do List users have a problem seeing which task is a priority. The typical To-do app is simply a list things you need to do without any major goal in mind. The first thing on your list is just the thing you thought of and which will be done next. These lists lack the intent of "success", getting you through your day without helping you achieve a higher purpose.

Achievers always work from a clear sense of priority. Your Success App is a short list of purposefully created priorities around each of the major areas of your life: Family, Friends, Health, Work, and . Live by priority. The Cambridge English Dictionary defines priority as "something that is very important and must be dealt with before other things", therefore we should only have one on each of our life categories.

## Appetite

I invested two weeks to develop a first iteration of a concept that can be tested with end users. I have also created an app that has been installed directly on two test phones (Android and iOS). These will allow me to interview 50 users while I take notes of their interaction with the app. 

The solution is composed by two main screens: Todo List and Todo List Detail. The experimentation phase will lead to insights in terms of value, usability, navigation, content, and future integrations.

<img src="/lib/images/sketch%201.0.png" width="350">

## Solution

Your Success List was built using Flutter—Google's open source SDK for creating mobile, web and desktop from a single codebase. The database used is SQLite.  

Material design has been used to style the user interface, giving it an Android-styled look and feel when using any type of phone. 

The Todo List will have a button to add new items. The Todo Detail will have controls to edit the current information or add a new Todo.


<p float="left">
    <img src="./lib/images/Todo%20List%201.0.png" alt="Todo List" width="200">
    <img src="./lib/images/Todo%20Detail%201.0.png"alt="Todo List Detail" width="200">
</p>

The Todo Detail will also have three options available through the top right elipsis: Save, Delete and Cancel. All of these options will navigate the user to the main screen.

## Rabbit Holes

This version will only have Android's feel and look. Also, I am looking for a way to make to dinamically filter topics in the Todo Detail View, in order to have only one "High" priority per topic. I am having issues with the state, as the list map function can not display future types—I'm trying to connect to the DB directly.

## No-gos

In a future iteration, a more scalable data storage technology will be incorporated by using either Google Firestore or Azure Cosmos. Also, with the goal to connect this To-do list to popular calendar solutions—Outlook, Google, iCalendar— a SSO integration will be implemented next.

In terms of frontend design, Cupertino widgets will be added to the condebase to create iOS-styled app, giving the user the look and feel appropriate for their device. Finally, phone notifications—based on due dates— has been added to the backlog.





