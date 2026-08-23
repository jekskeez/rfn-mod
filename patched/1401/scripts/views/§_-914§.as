package views
{
   import §_-I10§.§_-13r§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-914§ extends Sprite
   {
      
      private static const §_-k1X§:GlowFilter = new GlowFilter(16711680,1,3,3,16);
      
      private var §_-4A§:int = -1;
      
      private var §_-L1f§:int = §_-13r§.PLAYER_TYPE;
      
      private var §_-E21§:Boolean = true;
      
      private var §_-13d§:§_-S1U§ = null;
      
      private var §_-X1B§:§_-22V§ = null;
      
      private var §_-S2w§:Boolean = false;
      
      public function §_-914§(param1:int, param2:int = 0, param3:Number = 1, param4:Boolean = true, param5:Boolean = false)
      {
         super();
         this.§_-4A§ = param1;
         this.§_-L1f§ = param2;
         this.§_-E21§ = param4;
         this.§_-S2w§ = param5;
         this.§_-13d§ = new §_-S1U§(-1,param3);
         addChild(this.§_-13d§);
      }
      
      private function get isSelf() : Boolean
      {
         if(this.§_-L1f§ == §_-13r§.PLAYER_TYPE)
         {
            return this.§_-4A§ == Game.selfId;
         }
         return this.§_-4A§ == Game.self["clan_id"];
      }
      
      public function set league(param1:int) : void
      {
         var _loc2_:Boolean = true;
         if(this.§_-S2w§)
         {
            _loc2_ = this.isSelf || param1 >= §_-S1U§.§_-F7§.length - 2;
         }
         this.§_-13d§.league = param1;
         this.§_-13d§.visible = _loc2_;
         if(this.§_-E21§ && _loc2_)
         {
            this.§_-Eu§();
         }
      }
      
      public function get league() : int
      {
         return this.§_-13d§.league;
      }
      
      public function §_-Eu§() : void
      {
         if(!this.§_-13d§ || !this.§_-E21§ || !this.§_-13d§.visible)
         {
            return;
         }
         var _loc1_:Sprite = this.§_-13d§.§_-U1K§();
         if(!_loc1_)
         {
            return;
         }
         if(Boolean(this.§_-X1B§) && _loc1_.contains(this.§_-X1B§))
         {
            _loc1_.removeChild(this.§_-X1B§);
            this.§_-X1B§ = null;
         }
         var _loc2_:int = §_-13r§.§_-B2w§(this.§_-4A§,this.§_-L1f§);
         if(_loc2_ != -1)
         {
            this.§_-X1B§ = new §_-22V§(_loc2_.toString(),0,0,new TextFormat(§_-22V§.§_-F2z§,10,16777215));
            this.§_-X1B§.filters = [§_-k1X§];
            _loc1_.addChild(this.§_-X1B§);
         }
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-13d§.scale = param1;
      }
      
      public function get scale() : Number
      {
         return this.§_-13d§.scale;
      }
   }
}

