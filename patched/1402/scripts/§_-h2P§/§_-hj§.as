package §_-h2P§
{
   import game.mainGame.GameMap;
   import game.mainGame.§_-F1c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-hj§ implements §_-F1c§
   {
      
      private static const §_-x2a§:Number = 4;
      
      private var §_-a1e§:Vector.<§_-sE§> = new Vector.<§_-sE§>();
      
      private var map:GameMap;
      
      private var §_-AE§:§_-2w§;
      
      private var §_-p2H§:Boolean = false;
      
      private var §_-J2b§:Number = -1;
      
      public function §_-hj§(param1:GameMap)
      {
         super();
         this.map = param1;
         this.§_-AE§ = new §_-2w§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-gm§,§_-s2l§.§_-VB§]);
      }
      
      public function get §_-Ca§() : Boolean
      {
         return this.§_-p2H§;
      }
      
      public function set §_-Ca§(param1:Boolean) : void
      {
         this.§_-p2H§ = param1;
         if(param1)
         {
            return;
         }
         this.§_-o2p§();
      }
      
      public function §_-a1K§(param1:§_-sE§) : void
      {
         this.§_-AE§.add(param1);
      }
      
      public function remove(param1:int) : void
      {
         this.§_-AE§.remove(param1);
      }
      
      public function §_-a23§() : void
      {
         if(!this.§_-p2H§)
         {
            return;
         }
         §_-p2U§.add("SYNC start");
         this.§_-J2b§ = 0;
      }
      
      public function §_-o2p§() : void
      {
         §_-p2U§.add("SYNC stop");
         this.§_-J2b§ = -1;
      }
      
      public function reset() : void
      {
         §_-p2U§.add("SYNC reset");
         this.§_-J2b§ = -1;
         this.§_-a1e§ = new Vector.<§_-sE§>();
         this.§_-AE§.reset();
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc3_:§_-sE§ = null;
         var _loc2_:Array = this.map.§_-j1c§();
         while(this.§_-a1e§.length != 0)
         {
            _loc3_ = this.§_-a1e§.shift();
            this.§_-AE§.§_-DU§(_loc3_,_loc2_);
         }
         if(this.§_-J2b§ < 0 || !this.§_-p2H§)
         {
            return;
         }
         this.§_-J2b§ += param1;
         if(this.§_-J2b§ < §_-x2a§)
         {
            return;
         }
         this.§_-J2b§ = 0;
         this.§_-42i§();
      }
      
      private function §_-42i§() : void
      {
         var _loc2_:§_-sE§ = null;
         if(this.map.isBrokenWorld)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            return;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-AE§.§_-s2F§)
         {
            _loc1_.push(_loc2_.id,_loc2_.position.x,_loc2_.position.y,_loc2_.angle,_loc2_.linearVelocity.x,_loc2_.linearVelocity.y,_loc2_.angularVelocity);
         }
         if(_loc1_.length > 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-gm§,§_-u1O§.§_-c1M§,_loc1_);
         }
      }
      
      private function §_-52Y§(param1:int, param2:Array) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < 7)
            {
               _loc4_.push(param2[_loc3_ + _loc5_]);
               _loc5_++;
            }
            this.§_-a1e§.push(new §_-73m§(_loc4_,param1));
            _loc3_ += 7;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-gm§:
               this.§_-52Y§(param1[0],param1[1]);
               break;
            case §_-s2l§.§_-VB§:
               this.§_-Ca§ = param1[0] == Game.selfId;
         }
      }
   }
}

