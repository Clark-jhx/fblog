package com.clark.fblog.bean;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.ByteArrayInputStream;
import java.io.IOException;

/**
 * 新闻内容
 * http://wcf.open.cnblogs.com/news/item/651511
 */
public class NewBody implements IHtmlToObject {

    private String title;
    private String sourceName;
    private String submitDate;
    private String content;
    private String imageUrl;
    private String prevNews;
    private String nextNews;
    private String commentCount;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPrevNews() {
        return prevNews;
    }

    public void setPrevNews(String prevNews) {
        this.prevNews = prevNews;
    }

    public String getNextNews() {
        return nextNews;
    }

    public void setNextNews(String nextNews) {
        this.nextNews = nextNews;
    }

    public String getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(String commentCount) {
        this.commentCount = commentCount;
    }

    @Override
    public IHtmlToObject fromHtml(String htmlString) {
        NewBody newBody = new NewBody();
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

                        if ("Title".equals(tagName)) {
                            newBody.setTitle(xmlPullParser.nextText());
                        } else if ("SourceName".equals(tagName)) {
                            newBody.setSourceName(xmlPullParser.nextText());
                        } else if ("SubmitDate".equals(tagName)) {
                            newBody.setSubmitDate(xmlPullParser.nextText());
                        } else if ("Content".equals(tagName)) {
                            newBody.setContent(xmlPullParser.nextText());
                        } else if ("ImageUrl".equals(tagName)) {
                            newBody.setImageUrl(xmlPullParser.nextText());
                        } else if ("PrevNews".equals(tagName)) {
                            newBody.setPrevNews(xmlPullParser.nextText());
                        } else if ("NextNews".equals(tagName)) {
                            newBody.setNextNews(xmlPullParser.nextText());
                        } else if ("CommentCount".equals(tagName)) {
                            newBody.setCommentCount(xmlPullParser.nextText());
                        }
                        break;
                    case XmlPullParser.END_TAG:
                        break;
                }
                eventType = xmlPullParser.next();
            }
        } catch (XmlPullParserException | IOException e) {
            e.printStackTrace();
            return null;
        }

        return newBody;
    }
}
