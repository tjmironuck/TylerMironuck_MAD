package com.example.tjmir.coursework;


import android.os.Bundle;
import android.app.Fragment;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class DegreeListFragment extends Fragment implements AdapterView.OnItemClickListener{


    public DegreeListFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_degree_list, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();
        View view = getView();
        if (view != null){
            //load data into fragment
            //get the list view
            ListView listDegree = (ListView) view.findViewById(R.id.listView);
            //define an array adapter
            ArrayAdapter<Degree> listAdapter = new ArrayAdapter<Degree>(getActivity(), android.R.layout.simple_list_item_1, Degree.courses);
            //set the array adapter on the list view
            listDegree.setAdapter(listAdapter);
            //attach the listener to the listview
            listDegree.setOnItemClickListener(this);
        }
    }

    //create interface
    interface DegreeListListener{
        void itemClicked(long id);
    }

    //create listener
    private DegreeListListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (DegreeListListener) context;
    }

    @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id){
        if (listener != null){
            //tells the listener an item was clicked
            listener.itemClicked(id);
        }
    }
}
