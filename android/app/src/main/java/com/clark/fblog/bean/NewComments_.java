package com.clark.fblog.bean;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 新闻评论
 * http://wcf.open.cnblogs.com/news/item/651511/comments/1/2
 */
public class NewComments_ implements IHtmlToObject {

    private String title;
    private String id;
    private String updated;
    private List<Comment> comments;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public IHtmlToObject fromHtml(String htmlString) {
        NewComments_ newComments = new NewComments_();
        ArrayList<Comment> comments = new ArrayList<>();
        Comment comment = null;
        Author author = null;
        boolean entry_f = false;

        ByteArrayInputStream in = new ByteArrayInputStream(htmlString.getBytes());
        try {
            XmlPullParserFactory xmlPullParserFactory = XmlPullParserFactory.newInstance();
            XmlPullParser xmlPullParser = xmlPullParserFactory.newPullParser();
            xmlPullParser.setInput(in, "UTF-8");
            int eventType = xmlPullParser.getEventType();
            while (eventType != XmlPullParser.END_DOCUMENT) {
                String tagName = xmlPullParser.getName();
                switch (eventType) {
                    case XmlPullParser.START_DOCUMENT:
                        break;
                    case XmlPullParser.END_DOCUMENT:
                        break;
                    case XmlPullParser.START_TAG:
                        if ("entry".equals(tagName)) {
                            comment = new Comment();
                            entry_f = true;
                        }
                        if ("author".equals(tagName)){
                            author = new Author();
                        }
                        if (!entry_f) {
                            if ("title".equals(tagName)) {
                                newComments.setTitle(xmlPullParser.nextText());
                            } else if ("id".equals(tagName)) {
                                newComments.setId(xmlPullParser.nextText());
                            } else if ("updated".equals(tagName)) {
                                newComments.setUpdated(xmlPullParser.nextText());
                            }
                        } else {
                            if ("id".equals(tagName)) {
                                comment.setId(xmlPullParser.nextText());
                            } else if ("published".equals(tagName)) {
                                comment.setPublished(xmlPullParser.nextText());
                            } else if ("updated".equals(tagName)) {
                                comment.setUpdated(xmlPullParser.nextText());
                            } else if ("content".equals(tagName)) {
                                comment.setContent(xmlPullParser.nextText());
                            }else if ("name".equals(tagName)) {
                                author.setName(xmlPullParser.nextText());
                            } else if ("uri".equals(tagName)) {
                                author.setUri(xmlPullParser.nextText());
                            }
                        }
                        break;
                    case XmlPullParser.END_TAG:
                        if ("entry".equals(tagName)) {
                            entry_f = false;
                            comments.add(comment);
                            comment = null;
                        }
                        if ("author".equals(tagName)){
                            comment.setAuthor(author);
                            author = null;
                        }
                        if ("feed".equals(tagName)) {
                            newComments.setComments(comments);
                        }
                        break;
                }
                eventType = xmlPullParser.next();
            }
        } catch (XmlPullParserException | IOException e) {
            e.printStackTrace();
            return null;
        }

        return newComments;
    }

    public static class Comment{
        private String id;
        private String published;
        private String updated;
        private Author author;
        private String content;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getPublished() {
            return published;
        }

        public void setPublished(String published) {
            this.published = published;
        }

        public String getUpdated() {
            return updated;
        }

        public void setUpdated(String updated) {
            this.updated = updated;
        }

        public Author getAuthor() {
            return author;
        }

        public void setAuthor(Author author) {
            this.author = author;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }

    public static class Author{
        private String name;
        private String uri;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getUri() {
            return uri;
        }

        public void setUri(String uri) {
            this.uri = uri;
        }
    }
}
