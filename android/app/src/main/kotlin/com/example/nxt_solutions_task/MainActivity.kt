package com.example.nxt_solutions_task


import android.util.Log
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.bumptech.glide.Glide
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.imageview.ShapeableImageView
import com.squareup.picasso.Picasso;

class MainActivity: FlutterActivity() {
    private val CHANNEL = "android";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            if (call.method == "show_sheet") {
                val dialog = BottomSheetDialog(this)
                val view = layoutInflater.inflate(R.layout.bottom_sheet, null)
                var image =  view.findViewById<ShapeableImageView>(R.id.userImage)
                var name =  view.findViewById<TextView>(R.id.userName)
                var number =  view.findViewById<TextView>(R.id.userNum)
                var ticketTypeValue =  view.findViewById<TextView>(R.id.ticketTypeValue)
                var seatValue =  view.findViewById<TextView>(R.id.seatValue)


                val imageURL: String? = call.argument("imageURL");
                Picasso.get().load(imageURL.toString()).placeholder(R.drawable.worker).into(image);


                name.text =  call.argument("name");
                number.text= call.argument("number");
                ticketTypeValue.text= call.argument("ticketTypeValue");
                seatValue.text= call.argument("seatValue");

//        dialog.setCancelable(true)
                dialog.setContentView(view)
                dialog.show()
            }
        }
    }
//
//    private fun showBottomSheet( call) {
//        val dialog = BottomSheetDialog(this)
//        val view = layoutInflater.inflate(R.layout.bottom_sheet, null)
//        var image =  view.findViewById<ShapeableImageView>(R.id.userImage)
//        var name =  view.findViewById<TextView>(R.id.userName)
//        var number =  view.findViewById<TextView>(R.id.userNum)
//        var ticketTypeValue =  view.findViewById<TextView>(R.id.ticketTypeValue)
//        var seatValue =  view.findViewById<TextView>(R.id.seatValue)
//        //set data here
//
//        val imageURL = call.argument("imageURL");
//        Glide.with(this).load(imageURL).into(image) //get user image put it at imageUrlFromWeb
////
//        name.text =  call.argument("name");
//        number.text= call.argument("number");
//        ticketTypeValue.text= call.argument("ticketTypeValue");
//        seatValue.text= call.argument("seatValue");
//
////        dialog.setCancelable(true)
//        dialog.setContentView(view)
//        dialog.show()
//
//    }

}
