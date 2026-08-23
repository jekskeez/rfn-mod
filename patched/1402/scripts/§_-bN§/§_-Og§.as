package §_-bN§
{
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-hd§.§_-01M§;
   import buttons.§_-K2G§;
   import by.blooddy.crypto.image.PNGEncoder;
   import chat.§_-g1j§;
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
   import protocol.§_-u1O§;
   import utils.§_-L2J§;
   
   public class §_-Og§ extends Dialog
   {
      
      private static const §_-V1m§:Matrix = new Matrix(1,0,0,1,4,4);
      
      private static var §_-j25§:DisplayObject = null;
      
      private static var _instance:§_-Og§ = null;
      
      private var §_-E15§:Rectangle = new Rectangle(4,4,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      
      private var §_-N9§:Matrix = new Matrix(0.7,0,0,0.7,Game.starling.stage.stageWidth - 143,10);
      
      private var §_-w2a§:CheckBox = new CheckBox();
      
      private var image:Bitmap = new Bitmap();
      
      private var bitmapData:BitmapData = new BitmapData(Game.starling.stage.stageWidth + 8,Game.starling.stage.stageHeight + 8,false,9184768);
      
      private var §_-Z2k§:FileReference = new FileReference();
      
      private var §_-Y2f§:§_-K2G§ = null;
      
      private var §_-qm§:§_-K2G§ = null;
      
      public function §_-Og§()
      {
         super(gls("Опубликовать снимок"));
         this.image.x = 35;
         this.image.y = 10;
         this.image.scaleX = 0.5;
         this.image.scaleY = 0.5;
         addChild(this.image);
         §_-L2J§.§_-61Q§(this.§_-w2a§);
         this.§_-w2a§.selected = false;
         this.§_-w2a§.x = 35;
         this.§_-w2a§.y = 335;
         this.§_-w2a§.label = gls("Публиковать без подтверждения");
         this.§_-w2a§.width = 400;
         addChild(this.§_-w2a§);
         this.§_-Y2f§ = new §_-K2G§(gls("Опубликовать"));
         this.§_-Y2f§.x = 25;
         this.§_-Y2f§.y = 360;
         this.§_-Y2f§.addEventListener(MouseEvent.CLICK,this.savePhoto);
         addChild(this.§_-Y2f§);
         this.§_-qm§ = new §_-K2G§(gls("Сохранить на компьютере"));
         this.§_-qm§.x = 505 - this.§_-qm§.width;
         this.§_-qm§.y = 360;
         this.§_-qm§.addEventListener(MouseEvent.CLICK,this.§_-e§);
         addChild(this.§_-qm§);
         place();
         this.sound = "camera";
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-Og§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         if(this.visible)
         {
            return;
         }
         this.§_-XQ§();
         if(Game.§_-pn§)
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
         this.§_-Y2f§.visible = false;
         this.§_-qm§.x = int((this.width - this.§_-01q§ - this.§_-7N§ - this.§_-qm§.width) * 0.5);
         this.§_-w2a§.visible = false;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.§_-pn§ = this.§_-w2a§.selected;
      }
      
      private function §_-XQ§() : void
      {
         if(!Game.§_-q1L§ || !this.bitmapData || !this.image)
         {
            return;
         }
         var _loc1_:* = Game.§_-q1L§.mask;
         Game.§_-q1L§.mask = null;
         this.bitmapData.draw(§_-01M§.§_-W1z§(),§_-V1m§,null,null,this.§_-E15§);
         this.bitmapData.draw(Game.§_-q1L§,§_-V1m§,null,null,this.§_-E15§);
         Game.§_-q1L§.mask = _loc1_;
         if(§_-j25§ == null)
         {
            §_-j25§ = §_-uR§.§_-t2O§();
         }
         this.bitmapData.draw(§_-j25§,this.§_-N9§);
         this.image.bitmapData = this.bitmapData;
         if(this.§_-4q§ > this.§_-w2V§)
         {
            this.image.height = 314;
            this.image.width = this.image.height * (this.§_-4q§ / this.§_-w2V§);
            this.height = 450;
            this.width = 555 + (this.image.width - this.height);
         }
         else
         {
            this.image.width = 454;
            this.image.height = this.image.width * (this.§_-w2V§ / this.§_-4q§);
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
         Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-x1z§,1);
         if(§_-t2c§.active is §_-u24§)
         {
            §_-u24§.sendMessage(Game.selfId,"",§_-g1j§.§_-E2y§);
         }
         this.hide();
      }
      
      private function §_-e§(param1:MouseEvent) : void
      {
         §_-73Q§.§_-R1R§ = false;
         var _loc2_:ByteArray = PNGEncoder.encode(this.bitmapData);
         var _loc3_:Date = new Date();
         var _loc4_:String = "Screenshot" + " " + _loc3_.hours + "-" + _loc3_.minutes + "-" + _loc3_.seconds + " " + _loc3_.date + "-" + (_loc3_.month + 1) + "-" + _loc3_.fullYear + ".png";
         this.§_-Z2k§.save(_loc2_,_loc4_);
         Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-x1z§,1);
         this.hide();
      }
      
      private function get §_-4q§() : int
      {
         return Game.starling.stage.stageWidth + 8;
      }
      
      private function get §_-w2V§() : int
      {
         return Game.starling.stage.stageHeight + 8;
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         this.§_-E15§ = new Rectangle(4,4,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         this.§_-N9§ = new Matrix(0.7,0,0,0.7,Game.starling.stage.stageWidth - 143,10);
         this.bitmapData = new BitmapData(this.§_-4q§,this.§_-w2V§,false,9184768);
      }
   }
}

