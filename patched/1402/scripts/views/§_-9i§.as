package views
{
   import §_-48§.ListDataEvent;
   import §_-48§.ListElementEvent;
   import §_-5P§.§_-Z1f§;
   import §_-I2Y§.§_-18§;
   import §_-I2Y§.§_-l2r§;
   import §_-c2C§.§_-u24§;
   import §_-cA§.§_-3b§;
   import §_-cA§.§_-I2x§;
   import §_-cA§.§_-tP§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-9i§ extends §_-I2x§ implements §_-l2r§, §_-18§
   {
      
      private static const §_-A24§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-T5§;
      
      private var §_-H1G§:Object;
      
      public var §_-l2j§:Array;
      
      public function §_-9i§()
      {
         super();
         this.§_-H1G§ = {};
         this.§_-Uk§(false);
      }
      
      public function §_-Uk§(param1:Boolean) : void
      {
         if(param1)
         {
            Connection.forget(this.§_-x2f§,[§_-s2l§.§_-V2o§,§_-s2l§.§_-Yi§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-C1i§]);
         }
         else
         {
            Connection.listen(this.§_-x2f§,[§_-s2l§.§_-V2o§,§_-s2l§.§_-Yi§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-C1i§]);
         }
      }
      
      public function dispose() : void
      {
         this.§_-Uk§(true);
         Game.forget(this.§_-Y16§);
      }
      
      public function set(param1:Array) : void
      {
         var _loc2_:int = 0;
         §_-C30§();
         this.§_-H1G§ = {};
         for each(_loc2_ in param1)
         {
            this.§_-H1G§[_loc2_] = 1;
         }
         Game.listen(this.§_-Y16§);
         Game.request(param1,§_-9i§.§_-A24§);
      }
      
      public function inHollow(param1:int, param2:int) : void
      {
         var _loc3_:§_-tP§ = this.§_-k10§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.time = param2;
      }
      
      public function get self() : §_-tP§
      {
         return this.§_-k10§(Game.selfId);
      }
      
      protected function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_.id in this.§_-H1G§))
         {
            return;
         }
         if(!_loc2_.isLoaded(§_-9i§.§_-A24§))
         {
            return;
         }
         this.add(_loc2_);
         delete this.§_-H1G§[_loc2_.id];
      }
      
      private function add(param1:Player) : void
      {
         var _loc2_:§_-tP§ = new §_-tP§(param1);
         _loc2_.number = this.objects.length;
         _loc2_.shaman = this.§_-l2j§ ? this.§_-l2j§.indexOf(param1.id) != -1 : false;
         _loc2_.isDead = §_-u24§.§_-I2B§(param1.id);
         _loc2_.§_-xE§ = !§_-u24§.§_-ru§(param1.id);
         §_-LF§(_loc2_);
         this.§_-b6§();
      }
      
      override public function §_-Z1P§(param1:ListElementEvent) : void
      {
         this.§_-b6§();
      }
      
      private function §_-b6§() : void
      {
         this.objects.sort(this.§_-T2c§);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      private function §_-k15§(param1:§_-tP§, param2:§_-tP§) : int
      {
         var _loc3_:§_-tP§ = param1;
         var _loc4_:§_-tP§ = param2;
         if(_loc3_.number > _loc4_.number)
         {
            return 1;
         }
         return -1;
      }
      
      private function §_-T2c§(param1:§_-tP§, param2:§_-tP§) : int
      {
         var _loc3_:Array = [param1.shaman ? 0 : 1,param1.isDead ? 1 : 0,param1.§_-xE§ ? 1 : 0,param1.exit ? 1 : 0,param1.time,param1.number];
         var _loc4_:Array = [param2.shaman ? 0 : 1,param2.isDead ? 1 : 0,param2.§_-xE§ ? 1 : 0,param2.exit ? 1 : 0,param2.time,param2.number];
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
      
      private function §_-Pr§(param1:Array) : void
      {
         var _loc3_:§_-tP§ = null;
         var _loc4_:int = 0;
         var _loc5_:§_-tP§ = null;
         this.§_-l2j§ = param1;
         if(!this.§_-l2j§ || this.§_-l2j§.length == 0)
         {
            return;
         }
         var _loc2_:Vector.<§_-3b§> = this.objects.concat();
         for each(_loc3_ in _loc2_)
         {
            _loc3_.shaman = false;
         }
         for each(_loc4_ in this.§_-l2j§)
         {
            _loc5_ = this.§_-k10§(_loc4_);
            if(_loc5_ == null)
            {
               return;
            }
            _loc5_.shaman = true;
            _loc5_.§_-S2K§();
         }
      }
      
      private function join(param1:int, param2:Boolean) : void
      {
         var _loc3_:§_-tP§ = this.§_-k10§(param1);
         if(_loc3_)
         {
            _loc3_.isDead = false;
            _loc3_.exit = false;
            _loc3_.§_-xE§ = param2;
            _loc3_.§_-S2K§();
            return;
         }
         this.§_-H1G§[param1] = 1;
         Game.request(param1,§_-9i§.§_-A24§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:§_-tP§ = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-V2o§:
               this.join(param1[0],param1[1] != §_-s2l§.§_-ht§);
               break;
            case §_-s2l§.§_-Yi§:
               this.§_-l2j§ = param1[0].slice();
               this.§_-Pr§(this.§_-l2j§);
               break;
            case §_-s2l§.§_-v1r§:
               if(§_-u24§.§_-sR§(param1[0]))
               {
                  break;
               }
               _loc2_ = this.§_-k10§(param1[0]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = true;
               _loc2_.§_-xE§ = false;
               if(this.§_-l2j§ != null && _loc2_.player != null)
               {
                  _loc3_ = this.§_-l2j§.indexOf(_loc2_.player.id);
                  if(_loc3_ != -1)
                  {
                     this.§_-l2j§.splice(_loc3_,1);
                  }
               }
               _loc2_.shaman = false;
               _loc2_.§_-S2K§();
               break;
            case §_-s2l§.§_-V1b§:
               _loc2_ = this.§_-k10§(param1[0]);
               if(_loc2_ == null || _loc2_.time < int.MAX_VALUE)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-xE§ = false;
               _loc2_.exit = true;
               if(this.§_-l2j§ != null && _loc2_.player != null)
               {
                  _loc3_ = this.§_-l2j§.indexOf(_loc2_.player.id);
                  if(_loc3_ != -1)
                  {
                     this.§_-l2j§.splice(_loc3_,1);
                  }
               }
               _loc2_.shaman = false;
               _loc2_.§_-S2K§();
               break;
            case §_-s2l§.§_-N1Y§:
               if(param1[0] == §_-s2l§.§_-Y2§)
               {
                  break;
               }
               _loc2_ = this.§_-k10§(param1[1]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-S2K§();
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[1] != §_-Z1f§.§_-q1E§)
               {
                  break;
               }
               _loc2_ = this.§_-k10§(param1[0]);
               if(_loc2_ == null)
               {
                  break;
               }
               _loc2_.isDead = false;
               _loc2_.§_-S2K§();
         }
      }
      
      private function §_-k10§(param1:int) : §_-tP§
      {
         var _loc2_:§_-tP§ = null;
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

