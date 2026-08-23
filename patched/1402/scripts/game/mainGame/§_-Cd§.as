package game.mainGame
{
   import §_-X2V§.CastItemEvent;
   import events.CastItemsEvent;
   import flash.events.EventDispatcher;
   
   public class §_-Cd§ extends EventDispatcher
   {
      
      private var data:Vector.<§_-v1N§> = new Vector.<§_-v1N§>();
      
      public function §_-Cd§()
      {
         super();
      }
      
      public function update() : void
      {
         dispatchEvent(new CastItemsEvent(CastItemsEvent.UPDATE,[]));
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-v1N§ = null;
         for each(_loc1_ in this.data)
         {
            _loc1_.removeEventListener(CastItemEvent.§_-N1W§,this.§_-p16§);
         }
         this.data = new Vector.<§_-v1N§>();
      }
      
      public function reset() : void
      {
         this.data = this.data.filter(this.§_-B29§);
      }
      
      public function get items() : Vector.<§_-v1N§>
      {
         return this.data;
      }
      
      public function §_-815§(param1:Class, param2:int) : §_-v1N§
      {
         var _loc3_:§_-v1N§ = null;
         if(this.data.length == 0)
         {
            return null;
         }
         for each(_loc3_ in this.data)
         {
            if(_loc3_.§_-IA§ == param1 && _loc3_.type == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function §_-J2m§(param1:Vector.<§_-v1N§>) : void
      {
         var _loc2_:§_-v1N§ = null;
         this.dispose();
         for each(_loc2_ in param1)
         {
            if(_loc2_.count > 0)
            {
               this.data.push(_loc2_);
            }
         }
         for each(_loc2_ in this.data)
         {
            _loc2_.addEventListener(CastItemEvent.§_-N1W§,this.§_-p16§);
         }
         this.update();
      }
      
      public function add(param1:§_-v1N§) : void
      {
         var _loc3_:§_-v1N§ = null;
         if(param1.count == 0 && param1.type != §_-v1N§.§_-W29§)
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(this.data.length != 0)
         {
            for each(_loc3_ in this.data)
            {
               if(!(_loc3_.§_-IA§ != param1.§_-IA§ || _loc3_.type != param1.type))
               {
                  _loc2_ = true;
                  if(param1.type == §_-v1N§.§_-T1s§)
                  {
                     break;
                  }
                  _loc3_.count += param1.count;
                  break;
               }
            }
         }
         if(_loc2_)
         {
            return;
         }
         if(param1.count <= 0 && param1.type != §_-v1N§.§_-W29§)
         {
            return;
         }
         param1.addEventListener(CastItemEvent.§_-N1W§,this.§_-p16§);
         this.data.push(param1);
         dispatchEvent(new CastItemEvent(CastItemEvent.ITEM_ADD,param1));
      }
      
      private function §_-p16§(param1:CastItemEvent) : void
      {
         this.data = this.data.filter(this.§_-Gf§);
      }
      
      private function §_-Gf§(param1:§_-v1N§, param2:int, param3:Vector.<§_-v1N§>) : Boolean
      {
         if(param1.count > 0)
         {
            return true;
         }
         param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-p16§);
         return false;
      }
      
      private function §_-B29§(param1:§_-v1N§, param2:int, param3:Vector.<§_-v1N§>) : Boolean
      {
         if(param1.type == §_-v1N§.§_-T2l§ && param1.count > 0)
         {
            return true;
         }
         param1.removeEventListener(CastItemEvent.§_-N1W§,this.§_-p16§);
         return false;
      }
   }
}

