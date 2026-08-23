package views
{
   import §_-1§.§_-tY§;
   import §_-5C§.ListDataEvent;
   import §_-5C§.ListElementEvent;
   import §_-T2y§.§_-92z§;
   import §_-X1o§.§_-93Q§;
   import §_-X1o§.§_-X27§;
   import §_-X1o§.§_-jo§;
   import §_-Y22§.§_-C2x§;
   import §_-Y22§.§_-Mi§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-TP§ extends §_-93Q§ implements §_-C2x§, §_-Mi§
   {
      
      private static const §_-03g§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-329§ | §_-hF§.§_-P13§ | §_-hF§.§_-sK§;
      
      private var §_-K2o§:Object;
      
      public var §_-iX§:Array;
      
      public function §_-TP§()
      {
         super();
         this.§_-K2o§ = {};
         this.§_-33x§(false);
      }
      
      public function §_-33x§(param1:Boolean) : void
      {
         if(param1)
         {
            Connection.forget(this.§_-o2C§,[§_-S2I§.§_-e1h§,§_-S2I§.§_-82J§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-03G§,§_-S2I§.§_-w1R§]);
         }
         else
         {
            Connection.listen(this.§_-o2C§,[§_-S2I§.§_-e1h§,§_-S2I§.§_-82J§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-03G§,§_-S2I§.§_-w1R§]);
         }
      }
      
      public function dispose() : void
      {
         this.§_-33x§(true);
         Game.forget(this.§_-P9§);
      }
      
      public function set(param1:Array) : void
      {
         var _loc2_:int = 0;
         §_-61z§();
         this.§_-K2o§ = {};
         for each(_loc2_ in param1)
         {
            this.§_-K2o§[_loc2_] = 1;
         }
         Game.listen(this.§_-P9§);
         Game.request(param1,§_-TP§.§_-03g§);
      }
      
      public function inHollow(param1:int, param2:int) : void
      {
         var _loc3_:§_-jo§ = this.§_-SM§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.time = param2;
      }
      
      public function get self() : §_-jo§
      {
         return this.§_-SM§(Game.selfId);
      }
      
      protected function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_.id in this.§_-K2o§))
         {
            return;
         }
         if(!_loc2_.isLoaded(§_-TP§.§_-03g§))
         {
            return;
         }
         this.add(_loc2_);
         delete this.§_-K2o§[_loc2_.id];
      }
      
      private function add(param1:Player) : void
      {
         var _loc2_:§_-jo§ = new §_-jo§(param1);
         _loc2_.number = this.objects.length;
         _loc2_.shaman = this.§_-iX§ ? this.§_-iX§.indexOf(param1.id) != -1 : false;
         _loc2_.isDead = §_-92z§.§_-T1l§(param1.id);
         _loc2_.§_-W2y§ = !§_-92z§.§_-x2u§(param1.id);
         §_-yA§(_loc2_);
         this.§_-JH§();
      }
      
      override public function §_-YC§(param1:ListElementEvent) : void
      {
         this.§_-JH§();
      }
      
      private function §_-JH§() : void
      {
         this.objects.sort(this.§_-S1N§);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      private function §_-32I§(param1:§_-jo§, param2:§_-jo§) : int
      {
         var _loc3_:§_-jo§ = param1;
         var _loc4_:§_-jo§ = param2;
         if(_loc3_.number > _loc4_.number)
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-S1N§(param1:§_-jo§, param2:§_-jo§) : int
      {
         var _loc3_:Array = [param1.shaman ? 0 : 1,param1.isDead ? 1 : 0,param1.§_-W2y§ ? 1 : 0,param1.exit ? 1 : 0,param1.time,param1.number];
         var _loc4_:Array = [param2.shaman ? 0 : 1,param2.isDead ? 1 : 0,param2.§_-W2y§ ? 1 : 0,param2.exit ? 1 : 0,param2.time,param2.number];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_] < _loc4_[_loc5_])
            {
               return -1;
            }
            if(_loc3_[_loc5_] > _loc4_[_loc5_])
            {
               return 1;
            }
            _loc5_++;
         }
         return 0;
      }
      
      private function §_-23L§(param1:Array) : void
      {
         var _loc3_:§_-jo§ = null;
         var _loc4_:int = 0;
         var _loc5_:§_-jo§ = null;
         this.§_-iX§ = param1;
         if(!this.§_-iX§ || this.§_-iX§.length == 0)
         {
            return;
         }
         var _loc2_:Vector.<§_-X27§> = this.objects.concat();
         for each(_loc3_ in _loc2_)
         {
            _loc3_.shaman = false;
         }
         for each(_loc4_ in this.§_-iX§)
         {
            _loc5_ = this.§_-SM§(_loc4_);
            if(_loc5_ == null)
            {
               return;
            }
            _loc5_.shaman = true;
            _loc5_.§_-32w§();
         }
      }
      
      private function join(param1:int, param2:Boolean) : void
      {
         var _loc3_:§_-jo§ = this.§_-SM§(param1);
         if(_loc3_)
         {
            _loc3_.isDead = false;
            _loc3_.exit = false;
            _loc3_.§_-W2y§ = param2;
            _loc3_.§_-32w§();
            return;
         }
         this.§_-K2o§[param1] = 1;
         Game.request(param1,§_-TP§.§_-03g§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:§_-jo§ = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-e1h§:
               this.join(param1[0],param1[1] != §_-S2I§.§_-Oi§);
               break;
            case §_-S2I§.§_-82J§:
               this.§_-iX§ = param1[0].slice();
               this.§_-23L§(this.§_-iX§);
               break;
            case §_-S2I§.§_-F2m§:
               if(§_-92z§.§_-F2E§(param1[0]))
               {
                  break;
               }
               _loc2_ = this.§_-SM§(param1[0]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = true;
               _loc2_.§_-W2y§ = false;
               if(this.§_-iX§ != null && _loc2_.player != null)
               {
                  _loc3_ = this.§_-iX§.indexOf(_loc2_.player.id);
                  if(_loc3_ != -1)
                  {
                     this.§_-iX§.splice(_loc3_,1);
                  }
               }
               _loc2_.shaman = false;
               _loc2_.§_-32w§();
               break;
            case §_-S2I§.§_-R28§:
               _loc2_ = this.§_-SM§(param1[0]);
               if(_loc2_ == null || _loc2_.time < int.MAX_VALUE)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-W2y§ = false;
               _loc2_.exit = true;
               if(this.§_-iX§ != null && _loc2_.player != null)
               {
                  _loc3_ = this.§_-iX§.indexOf(_loc2_.player.id);
                  if(_loc3_ != -1)
                  {
                     this.§_-iX§.splice(_loc3_,1);
                  }
               }
               _loc2_.shaman = false;
               _loc2_.§_-32w§();
               break;
            case §_-S2I§.§_-03G§:
               if(param1[0] == §_-S2I§.§_-8n§)
               {
                  break;
               }
               _loc2_ = this.§_-SM§(param1[1]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-32w§();
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[1] != §_-tY§.§_-Yi§)
               {
                  break;
               }
               _loc2_ = this.§_-SM§(param1[0]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-32w§();
         }
      }
      
      private function §_-SM§(param1:int) : §_-jo§
      {
         var _loc2_:§_-jo§ = null;
         for each(_loc2_ in this.objects)
         {
            if(_loc2_.player.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

