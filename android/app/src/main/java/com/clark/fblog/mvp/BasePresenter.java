package com.clark.fblog.mvp;

public class BasePresenter<T extends IView> implements IPresenter {
    private T mView;

    public BasePresenter(){};

    public BasePresenter(T mView){
        this.mView = mView;
    }

    public void detachView() {
        this.mView = null;
    }

    public T getView(){
        return mView;
    }

}
