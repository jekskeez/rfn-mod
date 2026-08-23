package §_-81S§
{
   import buttons.§_-j18§;
   import com.api.Player;
   import events.PostEvent;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-xb§;
   import views.§_-U1§;
   import views.§_-s1A§;
   
   public class §_-63P§ extends §_-33w§
   {
      
      private static const §_-J1i§:int = 86400;
      
      private var playerId:int = -1;
      
      private var §_-zI§:int = -1;
      
      private var caption:§_-22V§ = null;
      
      private var photo:§_-s1A§ = null;
      
      private var §_-H14§:§_-j18§ = null;
      
      private var movieGift:MovieClip = null;
      
      private var §_-42S§:Boolean = false;
      
      public function §_-63P§(param1:int, param2:int, param3:int, param4:uint)
      {
         super(param1,param2,param4);
         this.playerId = param3;
      }
      
      override public function §_-027§() : void
      {
         if(this.caption != null)
         {
            return;
         }
         super.§_-027§();
         this.photo = new §_-s1A§(80);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-i2I§);
         addChild(_loc1_);
         addChild(new §_-22V§("<body>" + gls("Твой друг") + "</body>",85,10,style));
         this.caption = new §_-22V§("",148,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-o1P§);
         addChild(this.caption);
         var _loc2_:§_-22V§ = new §_-22V§("<body>" + gls("подарил тебе подарок! Скорее узнай, что там внутри!") + "</body>",85,25,style);
         addChild(_loc2_);
         this.§_-H14§ = new §_-j18§(gls("Принять"));
         this.§_-H14§.x = 660 - int(this.§_-H14§.width * 0.5);
         this.§_-H14§.y = 35;
         this.§_-H14§.addEventListener(MouseEvent.CLICK,this.§_-e1i§);
         addChild(this.§_-H14§);
         this.movieGift = new PostGiftMovie();
         this.movieGift.x = 580;
         this.movieGift.y = 35;
         this.movieGift.gotoAndStop(0);
         addChild(this.movieGift);
         §_-01Y§.§_-c9§(this.§_-I9§);
         var _loc3_:Player = Game.getPlayer(this.playerId);
         _loc3_.addEventListener(§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§,this.§_-rF§);
         Game.request(this.playerId,§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§);
      }
      
      override protected function get timeString() : String
      {
         var _loc1_:int = this.time + §_-J1i§ - (Game.§_-nE§ + int(getTimer() / 1000));
         if(_loc1_ <= 0)
         {
            §_-01Y§.§_-l2K§(this.§_-I9§);
            dispatchEvent(new PostEvent(eventId));
            return "";
         }
         var _loc2_:String = (_loc1_ % 60).toString();
         _loc2_ = (_loc2_.length == 1 ? "0" : "") + _loc2_;
         _loc1_ /= 60;
         var _loc3_:String = (_loc1_ % 60).toString();
         _loc3_ = (_loc3_.length == 1 ? "0" : "") + _loc3_;
         _loc1_ /= 60;
         var _loc4_:String = (_loc1_ % 60).toString();
         _loc4_ = (_loc4_.length == 1 ? "0" : "") + _loc4_;
         return _loc4_ + ":" + _loc3_ + ":" + _loc2_;
      }
      
      override protected function onRemove(param1:MouseEvent) : void
      {
         if(this.§_-42S§)
         {
            return;
         }
         this.§_-42S§ = true;
         Connection.§_-Li§(§_-h2B§.§_-d12§,1,this.eventId);
         super.onRemove(param1);
      }
      
      private function §_-e1i§(param1:MouseEvent) : void
      {
         if(this.§_-42S§)
         {
            return;
         }
         this.§_-42S§ = true;
         this.§_-O2e§.visible = false;
         this.§_-H14§.visible = false;
         this.§_-P1v§.visible = false;
         Connection.§_-Li§(§_-h2B§.§_-d12§,0,this.eventId);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-y2j§]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var packet:§_-S2I§ = param1;
         if(packet[1] != this.eventId)
         {
            return;
         }
         if(packet[2] != §_-U1§.§_-6n§)
         {
            this.§_-zI§ = packet[2];
            this.movieGift.play();
            this.movieGift.addFrameScript(17,function():void
            {
               showAward();
            });
            this.movieGift.addFrameScript(this.movieGift.totalFrames - 1,function():void
            {
               dispatchEvent(new PostEvent(eventId));
               movieGift.stop();
            });
         }
         else
         {
            dispatchEvent(new PostEvent(eventId));
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-y2j§]);
      }
      
      private function §_-I9§() : void
      {
         this.§_-P1v§.text = this.timeString;
         this.§_-P1v§.x = 657 - int(this.§_-P1v§.textWidth * 0.5);
      }
      
      private function §_-o1P§(param1:TextEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-rF§);
         this.photo.§_-031§(param1);
         this.caption.htmlText = "<body><b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b>,</body>";
      }
      
      private function showAward() : void
      {
         new §_-U1§(this.§_-zI§,this.localToGlobal(new Point(this.movieGift.x,this.movieGift.y))).show();
      }
   }
}

