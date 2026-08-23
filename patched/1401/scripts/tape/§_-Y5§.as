package tape
{
   import §_-637§.BodyDestructor;
   import §_-83V§.Balk;
   import §_-83V§.BalloonBody;
   import §_-83V§.Box;
   import §_-83V§.PoiseRight;
   import §_-83V§.Trampoline;
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-X2T§;
   import events.GameEvent;
   
   public class §_-Y5§ extends §_-3l§
   {
      
      public static const §_-a2Y§:int = 3;
      
      public static var §_-W1n§:Array = null;
      
      private static var _instance:§_-Y5§ = null;
      
      private var items:§_-xc§ = new §_-xc§();
      
      private var §_-G2w§:§_-xc§ = new §_-xc§();
      
      private var §_-Z2k§:Object = null;
      
      public function §_-Y5§()
      {
         super(§_-a2Y§,1,0,0,7,0,42,38);
         setData(this.§_-G2w§);
         this.init();
         update();
         _instance = this;
      }
      
      public static function §_-MW§(param1:int) : void
      {
         if(_instance == null || !_instance.visible)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _instance.§_-G2w§.objects.length)
         {
            if((_instance.§_-G2w§.objects[_loc2_] as §_-n2H§).id == param1)
            {
               (_instance.§_-G2w§.objects[_loc2_] as §_-n2H§).§_-MW§();
            }
            _loc2_++;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         Game.§_-R1D§(GameEvent.BALANCE_CHANGED,this.§_-f2N§);
         if(!param1)
         {
            return;
         }
         this.§_-f2N§();
         Game.§_-Y2s§(GameEvent.BALANCE_CHANGED,this.§_-f2N§);
      }
      
      public function get §_-P1A§() : int
      {
         return this.§_-G2w§.objects.length;
      }
      
      public function set §_-yg§(param1:Vector.<§_-K2k§>) : void
      {
         if(!this.visible)
         {
            return;
         }
         this.§_-Z2k§ = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§_-Z2k§[§_-X2T§.§_-X21§((param1[_loc2_] as §_-63z§).§_-L1z§.§_-D28§)] = true;
            _loc2_++;
         }
         this.§_-Fo§();
      }
      
      override protected function §_-bX§() : void
      {
      }
      
      override protected function updateButtons() : void
      {
      }
      
      private function init() : void
      {
         this.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-E2J§ * this.§_-x16§)
         {
            this.items.addObject(new §_-n2H§());
            _loc1_++;
         }
         §_-Y5§.§_-W1n§ = [{
            "id":§_-X2T§.§_-X21§(Balk),
            "used":false
         },{
            "id":§_-X2T§.§_-X21§(BodyDestructor),
            "used":false
         },{
            "id":§_-X2T§.§_-X21§(BalloonBody),
            "used":false
         },{
            "id":§_-X2T§.§_-X21§(PoiseRight),
            "used":false
         },{
            "id":§_-X2T§.§_-X21§(Box),
            "used":false
         },{
            "id":§_-X2T§.§_-X21§(Trampoline),
            "used":false
         }];
      }
      
      private function §_-Ij§(param1:§_-n2H§, param2:int, param3:Vector.<§_-K2k§>) : Boolean
      {
         return param1.id != -1;
      }
      
      private function §_-w1V§() : int
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-Y5§.§_-W1n§.length)
         {
            _loc2_ = §_-Y5§.§_-W1n§[_loc1_];
            if(!(_loc2_.id in this.§_-Z2k§) && !_loc2_.used)
            {
               _loc2_.used = true;
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      private function §_-Fo§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-Y5§.§_-W1n§.length)
         {
            §_-Y5§.§_-W1n§[_loc1_].used = false;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.items.objects.length)
         {
            if((this.items.objects[_loc1_] as §_-n2H§).blocked)
            {
               §_-Y5§.§_-W1n§[(this.items.objects[_loc1_] as §_-n2H§).§_-74§].used = true;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.items.objects.length)
         {
            if(!(this.items.objects[_loc1_] as §_-n2H§).blocked)
            {
               (this.items.objects[_loc1_] as §_-n2H§).id = this.§_-w1V§();
            }
            _loc1_++;
         }
         this.§_-G2w§.objects = this.items.objects.filter(this.§_-Ij§);
         update();
         this.§_-f2N§();
      }
      
      private function §_-f2N§(param1:GameEvent = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:§_-n2H§ = null;
         var _loc5_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-G2w§.objects.length)
         {
            _loc3_ = (this.§_-G2w§.objects[_loc2_] as §_-n2H§).id;
            if(_loc3_ != -1)
            {
               _loc4_ = this.§_-G2w§.objects[_loc2_] as §_-n2H§;
               _loc5_ = Game.§_-DJ§ >= §_-8S§.§_-CM§(_loc3_) || Game.§_-I2M§ < §_-8S§.§_-D2a§(_loc3_);
               _loc4_.§_-71t§.visible = _loc5_;
               _loc4_.§_-J6§.visible = !_loc5_;
            }
            _loc2_++;
         }
      }
   }
}

