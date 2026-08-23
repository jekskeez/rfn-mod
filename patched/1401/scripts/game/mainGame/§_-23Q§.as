package game.mainGame
{
   import §_-8I§.CastItemEvent;
   import events.CastItemsEvent;
   import flash.events.EventDispatcher;
   
   public class §_-23Q§ extends EventDispatcher
   {
      
      private var data:Vector.<§_-bM§> = new Vector.<§_-bM§>();
      
      public function §_-23Q§()
      {
         super();
      }
      
      public function update() : void
      {
         dispatchEvent(new CastItemsEvent(CastItemsEvent.UPDATE,[]));
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-bM§ = null;
         for each(_loc1_ in this.data)
         {
            _loc1_.removeEventListener(CastItemEvent.§_-q1E§,this.§_-C1w§);
         }
         this.data = new Vector.<§_-bM§>();
      }
      
      public function reset() : void
      {
         this.data = this.data.filter(this.§_-T1n§);
      }
      
      public function get items() : Vector.<§_-bM§>
      {
         return this.data;
      }
      
      public function §_-43X§(param1:Class, param2:int) : §_-bM§
      {
         var _loc3_:§_-bM§ = null;
         if(this.data.length == 0)
         {
            return null;
         }
         for each(_loc3_ in this.data)
         {
            if(_loc3_.§_-D28§ == param1 && _loc3_.type == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function §_-iU§(param1:Vector.<§_-bM§>) : void
      {
         var _loc2_:§_-bM§ = null;
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
            _loc2_.addEventListener(CastItemEvent.§_-q1E§,this.§_-C1w§);
         }
         this.update();
      }
      
      public function add(param1:§_-bM§) : void
      {
         var _loc3_:§_-bM§ = null;
         if(param1.count == 0 && param1.type != §_-bM§.§_-t2G§)
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(this.data.length != 0)
         {
            for each(_loc3_ in this.data)
            {
               if(!(_loc3_.§_-D28§ != param1.§_-D28§ || _loc3_.type != param1.type))
               {
                  _loc2_ = true;
                  if(param1.type == §_-bM§.§_-Qg§)
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
         if(param1.count <= 0 && param1.type != §_-bM§.§_-t2G§)
         {
            return;
         }
         param1.addEventListener(CastItemEvent.§_-q1E§,this.§_-C1w§);
         this.data.push(param1);
         dispatchEvent(new CastItemEvent(CastItemEvent.ITEM_ADD,param1));
      }
      
      private function §_-C1w§(param1:CastItemEvent) : void
      {
         this.data = this.data.filter(this.§_-02C§);
      }
      
      private function §_-02C§(param1:§_-bM§, param2:int, param3:Vector.<§_-bM§>) : Boolean
      {
         if(param1.count > 0)
         {
            return true;
         }
         param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-C1w§);
         return false;
      }
      
      private function §_-T1n§(param1:§_-bM§, param2:int, param3:Vector.<§_-bM§>) : Boolean
      {
         if(param1.type == §_-bM§.§_-S2D§ && param1.count > 0)
         {
            return true;
         }
         param1.removeEventListener(CastItemEvent.§_-q1E§,this.§_-C1w§);
         return false;
      }
   }
}

