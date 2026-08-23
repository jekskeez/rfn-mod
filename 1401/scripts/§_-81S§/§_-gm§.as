package §_-81S§
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-dc§.§_-e2W§;
   import flash.display.Sprite;
   import protocol.§_-S2I§;
   import views.§_-S1U§;
   
   public class §_-gm§ extends §_-33w§
   {
      
      private var data:int = 0;
      
      private var §_-l17§:§_-S1U§;
      
      public function §_-gm§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.data = param3 != -1 ? param3 : §_-13r§.§_-i1Z§(§_-e2W§.§_-W2X§(Game.self["clan_id"]).§_-A1h§);
      }
      
      override public function §_-027§() : void
      {
         if(this.§_-l17§)
         {
            return;
         }
         super.§_-027§();
         var _loc1_:int = §_-13r§.§_-K1M§(this.data,§_-13r§.CLAN_TYPE);
         var _loc2_:int = int(this.data * §_-13r§.§_-1I§);
         var _loc3_:String = §_-8S§.§_-11s§(_loc1_,§_-13r§.CLAN_TYPE);
         var _loc4_:§_-22V§ = new §_-22V§("",0,0,style);
         _loc4_.x = 85;
         _loc4_.y = 10;
         addChild(_loc4_);
         var _loc5_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-S2I§.§_-S1s§:
               _loc4_.htmlText = "<body>" + gls("Твой клан не участвовал в прошлом сезоне.\nВ новом сезоне вы не получаете бонусных очков.") + "<body>";
               _loc1_ = 0;
               _loc5_.graphics.lineStyle(2,16777215);
               _loc5_.graphics.moveTo(4,4);
               _loc5_.graphics.lineTo(-4,-4);
               _loc5_.graphics.moveTo(-4,4);
               _loc5_.graphics.lineTo(4,-4);
               break;
            case §_-S2I§.§_-E1L§:
               _loc4_.htmlText = "<body>" + gls("Твоему клану удалось попасть в лигу <b>{0}</b>!\n В новом сезоне вы получаете {1} бонусных очков.",_loc3_,_loc2_) + "<body>";
               break;
            case §_-S2I§.§_-U1s§:
               _loc4_.htmlText = "<body>" + gls("Твой клан перешёл в лигу <b>{0}</b>!",_loc3_) + "<body>";
         }
         this.§_-l17§ = new §_-S1U§(_loc1_,1);
         var _loc6_:Number = this.§_-l17§.width;
         var _loc7_:Number = 75 / _loc6_;
         _loc5_.scaleX = _loc5_.scaleY = _loc7_;
         this.§_-l17§.scale = _loc7_;
         this.§_-l17§.x = 40;
         this.§_-l17§.y = 35;
         this.§_-l17§.addChild(_loc5_);
         addChild(this.§_-l17§);
      }
   }
}

