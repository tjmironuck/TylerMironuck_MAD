package com.example.tjmir.boardjournal;

import android.app.ListActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ListAdapter;
import android.widget.TextView;
import io.realm.OrderedRealmCollection;
import io.realm.RealmBaseAdapter;

public class TrickAdapter extends RealmBaseAdapter<Trick> implements ListAdapter{
    private TrickListActivity activity;

    private static class ViewHolder {
        TextView trickName;
        TextView trickDate;
        CheckBox hasLanded;
    }

    TrickAdapter(TrickListActivity activity, OrderedRealmCollection<Trick> data){
        super(data);
        this.activity = activity;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;

        if (convertView == null) {
            convertView = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.trick_list_row, parent, false);
            viewHolder = new ViewHolder();
            viewHolder.trickName = (TextView) convertView.findViewById(R.id.bookTextView);
            viewHolder.trickDate = (TextView) convertView.findViewById(R.id.authorTextView);
            viewHolder.hasLanded = (CheckBox) convertView.findViewById(R.id.checkBox);
            viewHolder.hasLanded.setOnClickListener(listener);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        if (adapterData != null) {
            Trick trick = adapterData.get(position);
            viewHolder.trickName.setText(trick.getTrick_name());
            viewHolder.trickDate.setText(trick.getTrick_date());
            viewHolder.hasLanded.setChecked(trick.hasLanded());
            viewHolder.hasLanded.setTag(position);
        }
        return convertView;
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            int position = (Integer) view.getTag();
            if (adapterData != null) {
                Trick trick = adapterData.get(position);
                activity.changeTrickLanded(trick.getId());
            }
        }
    };
}
