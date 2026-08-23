package game.mainGame
{
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class §_-j2x§ extends §_-h2I§ implements §_-Tm§, §_-C2x§
   {
      
      private var §_-J1E§:Dictionary = new Dictionary(true);
      
      public var §_-z2R§:Rectangle = new Rectangle(0,40,§_-a9§.§_-9o§,§_-a9§.§_-31m§ - 40);
      
      private var §_-X2H§:GameMap;
      
      public function §_-j2x§(param1:GameMap, param2:Rectangle = null)
      {
         super();
         this.§_-X2H§ = param1;
         this.§_-z2R§ = param2 ? param2 : this.§_-z2R§;
         §_-01Y§.§_-h1R§(this.update);
      }
      
      public function get §_-O1E§() : GameMap
      {
         return this.§_-X2H§;
      }
      
      public function §_-P2Y§(param1:§_-jP§) : void
      {
         this.§_-J1E§[param1] = new §_-S2h§(param1,this);
         §_-83v§(this.§_-J1E§[param1]);
      }
      
      public function remove(param1:§_-jP§) : void
      {
         if(!(param1 in this.§_-J1E§) || !§_-ws§(this.§_-J1E§[param1]))
         {
            return;
         }
         removeChildStarling(this.§_-J1E§[param1]);
         this.§_-J1E§[param1].dispose();
         delete this.§_-J1E§[param1];
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:§_-S2h§ = null;
         for each(_loc2_ in this.§_-J1E§)
         {
            _loc2_.update(param1);
         }
      }
      
      public function dispose() : void
      {
         this.clear();
         §_-01Y§.§_-t1s§(this.update);
      }
      
      private function clear() : void
      {
         var _loc1_:§_-S2h§ = null;
         for each(_loc1_ in this.§_-J1E§)
         {
            _loc1_.dispose();
         }
         this.§_-J1E§ = new Dictionary(true);
      }
   }
}

