package com.rhino.study.recyclerview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import static android.os.Build.VERSION_CODES.M;

public class MainActivity extends AppCompatActivity {

    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;

    String[] valuse = {"Apple", "Appricot", "Avocado", "Banana", "Blackberry",
    "Blueberry", "Cherry", "Coconut", "Cranberry", "Grape Raisin", "Honeydew", "Jackfruit",
    "Lemon","Lime","Mango", "Watermelon"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mRecyclerView = (RecyclerView)findViewById(R.id.my_recycler_view);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);

        mAdapter = new MyAdapter(valuse);
        mRecyclerView.setAdapter(mAdapter);
    }

    public class FruitsHolder extends RecyclerView.ViewHolder implements View.OnClickListener{
        private TextView mTextView;

        public FruitsHolder(View itemView) {
            super(itemView);
            itemView.setOnClickListener(this);
            mTextView = (TextView)itemView;
        }

        @Override
        public void onClick(View view) {
            Toast.makeText(MainActivity.this, mTextView.getText() + "선택됨!",Toast.LENGTH_LONG).show();
        }
    }

    class MyAdapter extends RecyclerView.Adapter<FruitsHolder>
    {
        private String[] mDataset;

        public MyAdapter(String[] myDateset)
        {
            mDataset = myDateset;
        }

        @Override
        public FruitsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            View view = inflater.inflate(android.R.layout.simple_list_item_1, parent, false);
            return new FruitsHolder(view);
        }

        @Override
        public void onBindViewHolder(FruitsHolder holder, int position) {
            holder.mTextView.setText(mDataset[position]);
        }

        @Override
        public int getItemCount() {
            return mDataset.length;
        }
    }

}
