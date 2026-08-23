package tape
{
   import §_-8Q§.Balk;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.Box;
   import §_-8Q§.PoiseRight;
   import §_-8Q§.Trampoline;
   import §_-F5§.BodyDestructor;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-n1C§;
   import events.GameEvent;
   
   public class §_-K21§ extends §_-L2v§
   {
      
      public static const §_-q1b§:int = 3;
      
      public static var §_-M1W§:Array = null;
      
      private static var _instance:§_-K21§ = null;
      
      private var items:§_-h2f§ = new §_-h2f§();
      
      private var §_-11Y§:§_-h2f§ = new §_-h2f§();
      
      private var §_-d1m§:Object = null;
      
      public function §_-K21§()
      {
         super(§_-q1b§,1,0,0,7,0,42,38);
         setData(this.§_-11Y§);
         this.init();
         update();
         _instance = this;
      }
      
      public static function §_-9V§(param1:int) : void
      {
         if(_instance == null || !_instance.visible)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _instance.§_-11Y§.objects.length)
         {
            if((_instance.§_-11Y§.objects[_loc2_] as §_-iq§).id == param1)
            {
               (_instance.§_-11Y§.objects[_loc2_] as §_-iq§).§_-9V§();
            }
            _loc2_++;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         Game.§_-72j§(GameEvent.BALANCE_CHANGED,this.§_-yK§);
         if(!param1)
         {
            return;
         }
         this.§_-yK§();
         Game.§_-53O§(GameEvent.BALANCE_CHANGED,this.§_-yK§);
      }
      
      public function get §_-11x§() : int
      {
         return this.§_-11Y§.objects.length;
      }
      
      public function set §_-31w§(param1:Vector.<§_-QN§>) : void
      {
         if(!this.visible)
         {
            return;
         }
         this.§_-d1m§ = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§_-d1m§[§_-n1C§.§_-q2W§((param1[_loc2_] as §_-N1N§).§_-i1H§.§_-IA§)] = true;
            _loc2_++;
         }
         this.§_-h1n§();
      }
      
      override protected function §_-j2y§() : void
      {
      }
      
      override protected function updateButtons() : void
      {
      }
      
      private function init() : void
      {
         this.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-A1Z§ * this.§_-w1q§)
         {
            this.items.addObject(new §_-iq§());
            _loc1_++;
         }
         §_-K21§.§_-M1W§ = [{
            "id":§_-n1C§.§_-q2W§(Balk),
            "used":false
         },{
            "id":§_-n1C§.§_-q2W§(BodyDestructor),
            "used":false
         },{
            "id":§_-n1C§.§_-q2W§(BalloonBody),
            "used":false
         },{
            "id":§_-n1C§.§_-q2W§(PoiseRight),
            "used":false
         },{
            "id":§_-n1C§.§_-q2W§(Box),
            "used":false
         },{
            "id":§_-n1C§.§_-q2W§(Trampoline),
            "used":false
         }];
      }
      
      private function §_-R6§(param1:§_-iq§, param2:int, param3:Vector.<§_-QN§>) : Boolean
      {
         return param1.id != -1;
      }
      
      private function §_-n17§() : int
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-K21§.§_-M1W§.length)
         {
            _loc2_ = §_-K21§.§_-M1W§[_loc1_];
            if(!(_loc2_.id in this.§_-d1m§) && !_loc2_.used)
            {
               _loc2_.used = true;
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      private function §_-h1n§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-K21§.§_-M1W§.length)
         {
            §_-K21§.§_-M1W§[_loc1_].used = false;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.items.objects.length)
         {
            if((this.items.objects[_loc1_] as §_-iq§).blocked)
            {
               §_-K21§.§_-M1W§[(this.items.objects[_loc1_] as §_-iq§).§_-M1O§].used = true;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.items.objects.length)
         {
            if(!(this.items.objects[_loc1_] as §_-iq§).blocked)
            {
               (this.items.objects[_loc1_] as §_-iq§).id = this.§_-n17§();
            }
            _loc1_++;
         }
         this.§_-11Y§.objects = this.items.objects.filter(this.§_-R6§);
         update();
         this.§_-yK§();
      }
      
      private function §_-yK§(param1:GameEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:§_-iq§ = null;
         var _loc5_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-11Y§.objects.length)
         {
            _loc3_ = (this.§_-11Y§.objects[_loc2_] as §_-iq§).id;
            if(_loc3_ != -1)
            {
               _loc4_ = this.§_-11Y§.objects[_loc2_] as §_-iq§;
               _loc5_ = Game.§_-I20§ >= §_-93H§.§_-72A§(_loc3_) || Game.§_-v1T§ < §_-93H§.§_-m2N§(_loc3_);
               _loc4_.§_-zK§.visible = _loc5_;
               _loc4_.§_-D2s§.visible = !_loc5_;
            }
            _loc2_++;
         }
      }
   }
}

