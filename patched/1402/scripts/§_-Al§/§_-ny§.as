package §_-Al§
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   import utils.§_-B1d§;
   
   public class §_-ny§ extends §_-K1K§
   {
      
      private static const §_-q1s§:Array = [{
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
      
      public function §_-ny§()
      {
         super(§_-K1K§.§_-y2q§);
      }
      
      override protected function init() : void
      {
         super.init();
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-23Z§.length)
         {
            if(_loc1_ % 2 == 0)
            {
               this.§_-23Z§[_loc1_].name = _loc1_.toString();
               this.§_-23Z§[_loc1_].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-M29§);
            }
            else
            {
               this.§_-23Z§[_loc1_].selectable = false;
               this.§_-23Z§[_loc1_].mouseEnabled = false;
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
         while(_loc2_ < §_-q1s§.length)
         {
            _loc4_ = §_-q1s§[_loc2_]["id"] in this.values ? int(this.values[§_-q1s§[_loc2_]["id"]]) : 0;
            this.§_-23Z§[_loc2_ * 2].text = _loc4_.toString();
            this.§_-23Z§[_loc2_ * 2 + 1].text = §_-B1d§.§_-g2n§(_loc4_);
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:String = null;
         var _loc4_:§_-z1i§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-q1s§.length)
         {
            this.values[§_-q1s§[_loc1_]["id"]] = int(this.§_-23Z§[_loc1_ * 2].text);
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-C1W§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.writeByte(int(_loc3_));
            _loc4_.§_-C1W§(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get fieldList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-q1s§.length)
         {
            _loc1_.push(§_-q1s§[_loc2_]["title"],"Окончание через");
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
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         this.§_-23Z§[_loc2_ + 1].text = §_-B1d§.§_-g2n§(int(this.§_-23Z§[_loc2_].text));
      }
   }
}

