package §_-81S§
{
   import §_-I10§.§_-vy§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.events.TextEvent;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import protocol.§_-S2I§;
   import utils.§_-xb§;
   
   public class §_-i2f§ extends §_-33w§
   {
      
      private var caption:§_-22V§ = null;
      
      private var playerId:int = -1;
      
      private var §_-d1z§:int = -1;
      
      private var §_-L1J§:int = -1;
      
      public function §_-i2f§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,§_-S2I§.§_-hO§,param4);
         this.playerId = param2;
         this.§_-L1J§ = param3 & 0xFF;
         this.§_-d1z§ = param3 >> 8;
      }
      
      override public function §_-027§() : void
      {
         if(this.caption != null)
         {
            return;
         }
         super.§_-027§();
         var _loc1_:CollectionMailBackground = new CollectionMailBackground();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.width = _loc1_.height = 80;
         addChild(_loc1_);
         var _loc2_:Class = §_-vy§.§_-z2p§(this.§_-d1z§);
         var _loc3_:DisplayObject = new _loc2_();
         _loc3_.x = int((80 - _loc3_.width) * 0.5);
         _loc3_.y = int((80 - _loc3_.height) * 0.5);
         addChild(_loc3_);
         addChild(new §_-22V§("<body>" + gls("Игрок") + "</body>",85,10,style));
         this.caption = new §_-22V§("",125,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-o1P§);
         addChild(this.caption);
         addChild(new §_-22V§("<body>" + gls("обменялся с тобой!") + "<body>",85,25,style));
         var _loc4_:§_-22V§ = new §_-22V§(§_-vy§.§_-U2M§[this.§_-L1J§]["tittle"],85,40,new TextFormat(null,13,52275,true));
         addChild(_loc4_);
         var _loc5_:ExchangeArrowsView = new ExchangeArrowsView();
         _loc5_.scaleX = _loc5_.scaleY = 0.65;
         _loc5_.x = _loc4_.x + _loc4_.textWidth + 7;
         _loc5_.y = 42;
         addChild(_loc5_);
         addChild(new §_-22V§(§_-vy§.§_-U2M§[this.§_-d1z§]["tittle"],_loc5_.x + _loc5_.width,40,new TextFormat(null,13,39423,true)));
         var _loc6_:Player = Game.getPlayer(this.playerId);
         _loc6_.addEventListener(§_-hF§.§_-31q§,this.§_-rF§);
         Game.request(this.playerId,§_-hF§.§_-31q§);
      }
      
      private function §_-o1P§(param1:TextEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-rF§(param1:Player) : void
      {
         if(!type)
         {
         }
         param1.removeEventListener(this.§_-rF§);
         this.caption.htmlText = "<body><b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b></body>";
      }
   }
}

