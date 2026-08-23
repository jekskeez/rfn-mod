package §_-1k§
{
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import flash.display.Sprite;
   import protocol.§_-s2l§;
   import views.§_-Rj§;
   
   public class §_-U2F§ extends §_-G2R§
   {
      
      private var data:int = 0;
      
      private var §_-z1z§:§_-Rj§;
      
      public function §_-U2F§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.data = param3 != -1 ? param3 : §_-82O§.§_-p1E§(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).§_-gF§);
      }
      
      override public function §_-O1s§() : void
      {
         if(this.§_-z1z§)
         {
            return;
         }
         super.§_-O1s§();
         var _loc1_:int = §_-82O§.§_-h1C§(this.data,§_-82O§.CLAN_TYPE);
         var _loc2_:int = int(this.data * §_-82O§.§_-82V§);
         var _loc3_:String = §_-93H§.§_-XY§(_loc1_,§_-82O§.CLAN_TYPE);
         var _loc4_:§_-i5§ = new §_-i5§("",0,0,style);
         _loc4_.x = 85;
         _loc4_.y = 10;
         addChild(_loc4_);
         var _loc5_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-s2l§.§_-C2n§:
               _loc4_.htmlText = "<body>" + gls("Твой клан не участвовал в прошлом сезоне.\nВ новом сезоне вы не получаете бонусных очков.") + "<body>";
               _loc1_ = 0;
               _loc5_.graphics.lineStyle(2,16777215);
               _loc5_.graphics.moveTo(4,4);
               _loc5_.graphics.lineTo(-4,-4);
               _loc5_.graphics.moveTo(-4,4);
               _loc5_.graphics.lineTo(4,-4);
               break;
            case §_-s2l§.§_-e4§:
               _loc4_.htmlText = "<body>" + gls("Твоему клану удалось попасть в лигу <b>{0}</b>!\n В новом сезоне вы получаете {1} бонусных очков.",_loc3_,_loc2_) + "<body>";
               break;
            case §_-s2l§.§_-b1j§:
               _loc4_.htmlText = "<body>" + gls("Твой клан перешёл в лигу <b>{0}</b>!",_loc3_) + "<body>";
         }
         this.§_-z1z§ = new §_-Rj§(_loc1_,1);
         var _loc6_:Number = this.§_-z1z§.width;
         var _loc7_:Number = 75 / _loc6_;
         _loc5_.scaleX = _loc5_.scaleY = _loc7_;
         this.§_-z1z§.scale = _loc7_;
         this.§_-z1z§.x = 40;
         this.§_-z1z§.y = 35;
         this.§_-z1z§.addChild(_loc5_);
         addChild(this.§_-z1z§);
      }
   }
}

