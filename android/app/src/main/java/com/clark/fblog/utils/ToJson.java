package com.clark.fblog.utils;

import android.util.Log;

import com.clark.fblog.bean.News;

import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;

public class ToJson {

    /**
     * can not work
     *
     * @param xml
     * @return
     * @throws IOException
     * @throws JSONException
     */
    public static String xmlToJsonString(String xml) throws IOException, JSONException {
        ByteArrayInputStream in = new ByteArrayInputStream(xml.getBytes("UTF-8"));
        String xmlString = IOUtils.toString(in, "utf-8");
        JSONObject jsonObject = XML.toJSONObject(xmlString);
        return jsonObject.toString();
    }

    /**
     *
     * @param xmlString
     * @return
     */
    public static News xmlToObject(String xmlString) {
        News news = new News();
        ArrayList<News.New> entrys = new ArrayList<>();
        News.New aNew = null;
        boolean entry_f = false;
        ByteArrayInputStream in = new ByteArrayInputStream(xmlString.getBytes());
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
                            aNew = new News.New();
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
}
