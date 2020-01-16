package com.clark.fblog.bean;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 新闻列表
 * http://wcf.open.cnblogs.com/news/hot/2
 */
public class News_ implements IHtmlToObject {
    private String title;
    private String id;
    private String updated;
    private String link;

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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public ArrayList<New> getEntrys() {
        return entrys;
    }

    public void setEntrys(ArrayList<New> entrys) {
        this.entrys = entrys;
    }

    private ArrayList<New> entrys;

    @Override
    public News_ fromHtml(String htmlString) {
        News_ news = new News_();
        ArrayList<News_.New> entrys = new ArrayList<>();
        News_.New aNew = null;
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
                            aNew = new News_.New();
                            entry_f = true;
                        }
                        if (!entry_f) {
                            if ("title".equals(tagName)) {
                                news.setTitle(xmlPullParser.nextText());
                            } else if ("id".equals(tagName)) {
                                news.setId(xmlPullParser.nextText());
                            } else if ("updated".equals(tagName)) {
                                news.setUpdated(xmlPullParser.nextText());
                            } else if ("link".equals(tagName)) {
                                news.setLink(xmlPullParser.getAttributeValue(0));
                            }
                        } else {
                            if ("id".equals(tagName)) {
                                aNew.setId(xmlPullParser.nextText());
                            } else if ("title".equals(tagName)) {
                                aNew.setTitle(xmlPullParser.nextText());
                            } else if ("summary".equals(tagName)) {
                                aNew.setSummary(xmlPullParser.nextText());
                            } else if ("published".equals(tagName)) {
                                aNew.setPublished(xmlPullParser.nextText());
                            } else if ("updated".equals(tagName)) {
                                aNew.setUpdated(xmlPullParser.nextText());
                            } else if ("link".equals(tagName)) {
                                aNew.setLink(xmlPullParser.getAttributeValue(1));
                            } else if ("diggs".equals(tagName)) {
                                aNew.setDiggs(xmlPullParser.nextText());
                            } else if ("views".equals(tagName)) {
                                aNew.setViews(xmlPullParser.nextText());
                            }else if ("comments".equals(tagName)) {
                                aNew.setComments(xmlPullParser.nextText());
                            }else if ("topic".equals(tagName)) {
                                aNew.setTopic(xmlPullParser.nextText());
                            }else if ("topicIcon".equals(tagName)) {
                                aNew.setTopicIcon(xmlPullParser.nextText());
                            }else if ("sourceName".equals(tagName)) {
                                aNew.setSourceName(xmlPullParser.nextText());
                            }
                        }
                        break;
                    case XmlPullParser.END_TAG:
                        if ("entry".equals(tagName)) {
                            entry_f = false;
                            entrys.add(aNew);
                            aNew = null;
                        }
                        if ("feed".equals(tagName)) {
                            news.setEntrys(entrys);
                        }
                        break;
                }
                eventType = xmlPullParser.next();
            }
        } catch (XmlPullParserException | IOException e) {
            e.printStackTrace();
            return null;
        }

        return news;
    }


    public static class New{
        private String id;
        private String title;
        private String summary;

        public String getPublished() {
            return published;
        }

        public void setPublished(String published) {
            this.published = published;
        }

        private String published;
        private String updated;
        private String link;
        private String diggs;
        private String views;
        private String comments;
        private String topic;
        private String topicIcon;
        private String sourceName;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getSummary() {
            return summary;
        }

        public void setSummary(String summary) {
            this.summary = summary;
        }

        public String getUpdated() {
            return updated;
        }

        public void setUpdated(String update) {
            this.updated = update;
        }

        public String getLink() {
            return link;
        }

        public void setLink(String link) {
            this.link = link;
        }

        public String getDiggs() {
            return diggs;
        }

        public void setDiggs(String diggs) {
            this.diggs = diggs;
        }

        public String getViews() {
            return views;
        }

        public void setViews(String views) {
            this.views = views;
        }

        public String getComments() {
            return comments;
        }

        public void setComments(String comments) {
            this.comments = comments;
        }

        public String getTopic() {
            return topic;
        }

        public void setTopic(String tipic) {
            this.topic = tipic;
        }

        public String getTopicIcon() {
            return topicIcon;
        }

        public void setTopicIcon(String topicIcon) {
            this.topicIcon = topicIcon;
        }

        public String getSourceName() {
            return sourceName;
        }

        public void setSourceName(String sourceName) {
            this.sourceName = sourceName;
        }
    }
}
