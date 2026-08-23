package §_-p1f§
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   import utils.§_-ex§;
   
   public class §_-W2z§ extends §_-6Y§
   {
      
      private static const §_-l2W§:Array = [{
         "title":"vip",
         "id":2
      },{
         "title":"golden_cup",
         "id":7
      },{
         "title":"unlimited_mana",
         "id":9
      },{
         "title":"unlimited_energy",
         "id":11
      },{
         "title":"mana_regeneration",
         "id":13
      },{
         "title":"birthday_2015",
         "id":18
      },{
         "title":"double_collections",
         "id":20
      },{
         "title":"double_experience",
         "id":21
      }];
      
      private var values:Object = {};
      
      public function §_-W2z§()
      {
         super(§_-6Y§.§_-O2P§);
      }
      
      override protected function init() : void
      {
         super.init();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-53o§.length)
         {
            if(_loc1_ % 2 == 0)
            {
               this.§_-53o§[_loc1_].name = _loc1_.toString();
               this.§_-53o§[_loc1_].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-52t§);
            }
            else
            {
               this.§_-53o§[_loc1_].selectable = false;
               this.§_-53o§[_loc1_].mouseEnabled = false;
            }
            _loc1_++;
         }
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            this.values[_loc3_] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-l2W§.length)
         {
            _loc4_ = §_-l2W§[_loc2_]["id"] in this.values ? int(this.values[§_-l2W§[_loc2_]["id"]]) : 0;
            this.§_-53o§[_loc2_ * 2].text = _loc4_.toString();
            this.§_-53o§[_loc2_ * 2 + 1].text = §_-ex§.§_-d2X§(_loc4_);
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-l2W§.length)
         {
            this.values[§_-l2W§[_loc1_]["id"]] = int(this.§_-53o§[_loc1_ * 2].text);
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-U1M§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-s15§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.writeByte(int(_loc3_));
            _loc4_.§_-s15§(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get fieldList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-l2W§.length)
         {
            _loc1_.push(§_-l2W§[_loc2_]["title"],"Окончание через");
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 120;
      }
      
      override protected function get fieldOffset() : int
      {
         return 10;
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         this.§_-53o§[_loc2_ + 1].text = §_-ex§.§_-d2X§(int(this.§_-53o§[_loc2_].text));
      }
   }
}

