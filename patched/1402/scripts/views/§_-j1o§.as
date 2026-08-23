package views
{
   import §_-X1k§.§_-82O§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-j1o§ extends Sprite
   {
      
      private static const §_-e1O§:GlowFilter = new GlowFilter(16711680,1,3,3,16);
      
      private var §_-n2x§:int = -1;
      
      private var §_-725§:int = §_-82O§.PLAYER_TYPE;
      
      private var §_-z26§:Boolean = true;
      
      private var §_-Z1R§:§_-Rj§ = null;
      
      private var §_-ch§:§_-i5§ = null;
      
      private var §_-n1y§:Boolean = false;
      
      public function §_-j1o§(param1:int, param2:int = 0, param3:Number = 1, param4:Boolean = true, param5:Boolean = false)
      {
         super();
         this.§_-n2x§ = param1;
         this.§_-725§ = param2;
         this.§_-z26§ = param4;
         this.§_-n1y§ = param5;
         this.§_-Z1R§ = new §_-Rj§(-1,param3);
         addChild(this.§_-Z1R§);
      }
      
      private function get isSelf() : Boolean
      {
         if(this.§_-725§ == §_-82O§.PLAYER_TYPE)
         {
            return this.§_-n2x§ == Game.selfId;
         }
         return this.§_-n2x§ == Game.self["clan_id"];
      }
      
      public function set league(param1:int) : void
      {
         var _loc2_:Boolean = true;
         if(this.§_-n1y§)
         {
            _loc2_ = this.isSelf || param1 >= §_-Rj§.§_-m8§.length - 2;
         }
         this.§_-Z1R§.league = param1;
         this.§_-Z1R§.visible = _loc2_;
         if(this.§_-z26§ && _loc2_)
         {
            this.§_-C33§();
         }
      }
      
      public function get league() : int
      {
         return this.§_-Z1R§.league;
      }
      
      public function §_-C33§() : void
      {
         if(!this.§_-Z1R§ || !this.§_-z26§ || !this.§_-Z1R§.visible)
         {
            return;
         }
         var _loc1_:Sprite = this.§_-Z1R§.§_-C7§();
         if(!_loc1_)
         {
            return;
         }
         if(Boolean(this.§_-ch§) && _loc1_.contains(this.§_-ch§))
         {
            _loc1_.removeChild(this.§_-ch§);
            this.§_-ch§ = null;
         }
         var _loc2_:int = §_-82O§.§_-3S§(this.§_-n2x§,this.§_-725§);
         if(_loc2_ != -1)
         {
            this.§_-ch§ = new §_-i5§(_loc2_.toString(),0,0,new TextFormat(§_-i5§.§_-c10§,10,16777215));
            this.§_-ch§.filters = [§_-e1O§];
            _loc1_.addChild(this.§_-ch§);
         }
      }
      
      public function set scale(param1:Number) : void
      {
         this.§_-Z1R§.scale = param1;
      }
      
      public function get scale() : Number
      {
         return this.§_-Z1R§.scale;
      }
   }
}

