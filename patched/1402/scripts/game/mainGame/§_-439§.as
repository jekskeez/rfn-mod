package game.mainGame
{
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class §_-439§ extends §_-aS§ implements §_-F1c§, §_-l2r§
   {
      
      private var §_-x1m§:Dictionary = new Dictionary(true);
      
      public var §_-128§:Rectangle = new Rectangle(0,40,§_-Zy§.§_-21V§,§_-Zy§.§_-02T§ - 40);
      
      private var §_-Wx§:GameMap;
      
      public function §_-439§(param1:GameMap, param2:Rectangle = null)
      {
         super();
         this.§_-Wx§ = param1;
         this.§_-128§ = param2 ? param2 : this.§_-128§;
         §_-p1V§.§_-A3z§(this.update);
      }
      
      public function get §_-e2§() : GameMap
      {
         return this.§_-Wx§;
      }
      
      public function §_-a1K§(param1:§_-jC§) : void
      {
         this.§_-x1m§[param1] = new §_-F1x§(param1,this);
         §_-J2J§(this.§_-x1m§[param1]);
      }
      
      public function remove(param1:§_-jC§) : void
      {
         if(!(param1 in this.§_-x1m§) || !§_-U2E§(this.§_-x1m§[param1]))
         {
            return;
         }
         removeChildStarling(this.§_-x1m§[param1]);
         this.§_-x1m§[param1].dispose();
         delete this.§_-x1m§[param1];
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:§_-F1x§ = null;
         for each(_loc2_ in this.§_-x1m§)
         {
            _loc2_.update(param1);
         }
      }
      
      public function dispose() : void
      {
         this.clear();
         §_-p1V§.§_-DO§(this.update);
      }
      
      private function clear() : void
      {
         var _loc1_:§_-F1x§ = null;
         for each(_loc1_ in this.§_-x1m§)
         {
            _loc1_.dispose();
         }
         this.§_-x1m§ = new Dictionary(true);
      }
   }
}

