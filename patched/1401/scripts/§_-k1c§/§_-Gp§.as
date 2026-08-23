package §_-k1c§
{
   import §_-C1l§.§_-a2§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import buttons.§_-j18§;
   import by.blooddy.crypto.image.PNGEncoder;
   import chat.§_-A1n§;
   import com.api.Services;
   import fl.controls.CheckBox;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.FileReference;
   import flash.utils.ByteArray;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-vo§;
   
   public class §_-Gp§ extends Dialog
   {
      
      private static const §_-A3T§:Matrix = new Matrix(1,0,0,1,4,4);
      
      private static var §_-X1G§:DisplayObject = null;
      
      private static var _instance:§_-Gp§ = null;
      
      private var §_-H1C§:Rectangle = new Rectangle(4,4,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      
      private var §_-q2h§:Matrix = new Matrix(0.7,0,0,0.7,Game.starling.stage.stageWidth - 143,10);
      
      private var §_-m2L§:CheckBox = new CheckBox();
      
      private var image:Bitmap = new Bitmap();
      
      private var bitmapData:BitmapData = new BitmapData(Game.starling.stage.stageWidth + 8,Game.starling.stage.stageHeight + 8,false,9184768);
      
      private var §_-O1K§:FileReference = new FileReference();
      
      private var §_-De§:§_-j18§ = null;
      
      private var §_-J2B§:§_-j18§ = null;
      
      public function §_-Gp§()
      {
         super(gls("Опубликовать снимок"));
         this.image.x = 35;
         this.image.y = 10;
         this.image.scaleX = 0.5;
         this.image.scaleY = 0.5;
         addChild(this.image);
         §_-vo§.§_-l1V§(this.§_-m2L§);
         this.§_-m2L§.selected = false;
         this.§_-m2L§.x = 35;
         this.§_-m2L§.y = 335;
         this.§_-m2L§.label = gls("Публиковать без подтверждения");
         this.§_-m2L§.width = 400;
         addChild(this.§_-m2L§);
         this.§_-De§ = new §_-j18§(gls("Опубликовать"));
         this.§_-De§.x = 25;
         this.§_-De§.y = 360;
         this.§_-De§.addEventListener(MouseEvent.CLICK,this.savePhoto);
         addChild(this.§_-De§);
         this.§_-J2B§ = new §_-j18§(gls("Сохранить на компьютере"));
         this.§_-J2B§.x = 505 - this.§_-J2B§.width;
         this.§_-J2B§.y = 360;
         this.§_-J2B§.addEventListener(MouseEvent.CLICK,this.§_-B3e§);
         addChild(this.§_-J2B§);
         place();
         this.sound = "camera";
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-Gp§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         if(this.visible)
         {
            return;
         }
         this.§_-H1S§();
         if(Game.§_-s17§)
         {
            this.savePhoto();
            return;
         }
         super.show();
         place();
         if(Services.photos != null)
         {
            return;
         }
         this.§_-De§.visible = false;
         this.§_-J2B§.x = int((this.width - this.§_-R1Y§ - this.§_-4n§ - this.§_-J2B§.width) * 0.5);
         this.§_-m2L§.visible = false;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.§_-s17§ = this.§_-m2L§.selected;
      }
      
      private function §_-H1S§() : void
      {
         if(!Game.§_-d2t§ || !this.bitmapData || !this.image)
         {
            return;
         }
         var _loc1_:* = Game.§_-d2t§.mask;
         Game.§_-d2t§.mask = null;
         this.bitmapData.draw(§_-a2§.§_-727§(),§_-A3T§,null,null,this.§_-H1C§);
         this.bitmapData.draw(Game.§_-d2t§,§_-A3T§,null,null,this.§_-H1C§);
         Game.§_-d2t§.mask = _loc1_;
         if(§_-X1G§ == null)
         {
            §_-X1G§ = §_-k2X§.§_-81z§();
         }
         this.bitmapData.draw(§_-X1G§,this.§_-q2h§);
         this.image.bitmapData = this.bitmapData;
         if(this.§_-jE§ > this.§_-e26§)
         {
            this.image.height = 314;
            this.image.width = this.image.height * (this.§_-jE§ / this.§_-e26§);
            this.height = 450;
            this.width = 555 + (this.image.width - this.height);
         }
         else
         {
            this.image.width = 454;
            this.image.height = this.image.width * (this.§_-e26§ / this.§_-jE§);
            this.width = 555;
            this.height = 450 + (this.image.height - this.width);
         }
      }
      
      private function savePhoto(param1:MouseEvent = null) : void
      {
         if(Services.photos == null)
         {
            this.hide();
            return;
         }
         Services.photos.savePhoto(this.bitmapData);
         Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-i1V§,1);
         if(§_-71o§.active is §_-92z§)
         {
            §_-92z§.sendMessage(Game.selfId,"",§_-A1n§.§_-uj§);
         }
         this.hide();
      }
      
      private function §_-B3e§(param1:MouseEvent) : void
      {
         §_-K1r§.§_-O1P§ = false;
         var _loc2_:ByteArray = PNGEncoder.encode(this.bitmapData);
         var _loc3_:Date = new Date();
         var _loc4_:String = "Screenshot" + " " + _loc3_.hours + "-" + _loc3_.minutes + "-" + _loc3_.seconds + " " + _loc3_.date + "-" + (_loc3_.month + 1) + "-" + _loc3_.fullYear + ".png";
         this.§_-O1K§.save(_loc2_,_loc4_);
         Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-i1V§,1);
         this.hide();
      }
      
      private function get §_-jE§() : int
      {
         return Game.starling.stage.stageWidth + 8;
      }
      
      private function get §_-e26§() : int
      {
         return Game.starling.stage.stageHeight + 8;
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         this.§_-H1C§ = new Rectangle(4,4,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         this.§_-q2h§ = new Matrix(0.7,0,0,0.7,Game.starling.stage.stageWidth - 143,10);
         this.bitmapData = new BitmapData(this.§_-jE§,this.§_-e26§,false,9184768);
      }
   }
}

