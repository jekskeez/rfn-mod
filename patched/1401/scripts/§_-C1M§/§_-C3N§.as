package §_-C1m§
{
   import game.mainGame.GameMap;
   import game.mainGame.§_-Tm§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-C3N§ implements §_-Tm§
   {
      
      private static const §_-g2m§:Number = 4;
      
      private var §_-S1j§:Vector.<§_-d29§> = new Vector.<§_-d29§>();
      
      private var map:GameMap;
      
      private var §_-E19§:§_-P22§;
      
      private var §_-62S§:Boolean = false;
      
      private var §_-6G§:Number = -1;
      
      public function §_-C3N§(param1:GameMap)
      {
         super();
         this.map = param1;
         this.§_-E19§ = new §_-P22§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-D1s§,§_-S2I§.§_-jr§]);
      }
      
      public function get §_-G1U§() : Boolean
      {
         return this.§_-62S§;
      }
      
      public function set §_-G1U§(param1:Boolean) : void
      {
         this.§_-62S§ = param1;
         if(param1)
         {
            return;
         }
         this.§_-G1F§();
      }
      
      public function §_-P2Y§(param1:§_-d29§) : void
      {
         this.§_-E19§.add(param1);
      }
      
      public function remove(param1:int) : void
      {
         this.§_-E19§.remove(param1);
      }
      
      public function §_-J2a§() : void
      {
         if(!this.§_-62S§)
         {
            return;
         }
         §_-TQ§.add("SYNC start");
         this.§_-6G§ = 0;
      }
      
      public function §_-G1F§() : void
      {
         §_-TQ§.add("SYNC stop");
         this.§_-6G§ = -1;
      }
      
      public function reset() : void
      {
         §_-TQ§.add("SYNC reset");
         this.§_-6G§ = -1;
         this.§_-S1j§ = new Vector.<§_-d29§>();
         this.§_-E19§.reset();
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc3_:§_-d29§ = null;
         var _loc2_:Array = this.map.§_-8q§();
         while(this.§_-S1j§.length != 0)
         {
            _loc3_ = this.§_-S1j§.shift();
            this.§_-E19§.§_-218§(_loc3_,_loc2_);
         }
         if(this.§_-6G§ < 0 || !this.§_-62S§)
         {
            return;
         }
         this.§_-6G§ += param1;
         if(this.§_-6G§ < §_-g2m§)
         {
            return;
         }
         this.§_-6G§ = 0;
         this.§_-SA§();
      }
      
      private function §_-SA§() : void
      {
         var _loc2_:§_-d29§ = null;
         if(this.map.isBrokenWorld)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            return;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-E19§.§_-23O§)
         {
            _loc1_.push(_loc2_.id,_loc2_.position.x,_loc2_.position.y,_loc2_.angle,_loc2_.linearVelocity.x,_loc2_.linearVelocity.y,_loc2_.angularVelocity);
         }
         if(_loc1_.length > 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-D1s§,§_-h2B§.§_-Q1G§,_loc1_);
         }
      }
      
      private function §_-P1r§(param1:int, param2:Array) : void
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
            this.§_-S1j§.push(new §_-w2D§(_loc4_,param1));
            _loc3_ += 7;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-D1s§:
               this.§_-P1r§(param1[0],param1[1]);
               break;
            case §_-S2I§.§_-jr§:
               this.§_-G1U§ = param1[0] == Game.selfId;
         }
      }
   }
}

