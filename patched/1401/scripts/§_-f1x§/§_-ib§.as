package §_-f1x§
{
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-r16§.§_-22l§;
   import §_-r16§.§_-22v§;
   import §_-r16§.§_-x22§;
   import flash.display.Sprite;
   import flash.events.Event;
   import tape.§_-xc§;
   import utils.§_-Y25§;
   
   public class §_-ib§ extends Sprite
   {
      
      private var data:§_-xc§ = null;
      
      private var §_-C1K§:§_-x22§ = null;
      
      private var §_-Dl§:Boolean = false;
      
      private var §_-jS§:Boolean = false;
      
      public var §_-A1t§:int = 1;
      
      public function §_-ib§(param1:int)
      {
         super();
         this.§_-A1t§ = param1;
         this.init();
      }
      
      public function setData(param1:Vector.<§_-Y25§>, param2:Vector.<§_-Y25§>) : void
      {
         this.§_-Dl§ = true;
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            (this.data.objects[_loc3_] as §_-22l§).§_-93Y§ = param1[(this.data.objects[_loc3_] as §_-22l§).elementId];
            _loc3_++;
         }
         this.§_-C1K§.§_-93Y§ = param2[this.§_-C1K§.elementId];
         this.§_-Dl§ = false;
         this.§_-J2N§();
      }
      
      public function §_-um§(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            if((this.data.objects[_loc3_] as §_-22l§).elementId == param1)
            {
               (this.data.objects[_loc3_] as §_-22l§).§_-Qw§ = param2;
            }
            _loc3_++;
         }
      }
      
      public function §_-31O§(param1:Boolean) : void
      {
         this.§_-jS§ = false;
         if(!param1 || !this.§_-O1i§())
         {
            return;
         }
         this.§_-Dl§ = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            (this.data.objects[_loc2_] as §_-22l§).§_-11A§();
            _loc2_++;
         }
         this.§_-Dl§ = false;
         this.§_-J2N§();
         this.§_-C1K§.§_-31f§();
      }
      
      public function §_-O1i§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            if(!(this.data.objects[_loc1_] as §_-22l§).§_-2B§)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function init() : void
      {
         var _loc3_:§_-22l§ = null;
         this.data = new §_-xc§();
         var _loc1_:int = 0;
         while(_loc1_ < §_-vy§.§_-C3T§[this.§_-A1t§]["set"].length)
         {
            _loc3_ = new §_-22l§(§_-vy§.§_-C3T§[this.§_-A1t§]["set"][_loc1_]);
            _loc3_.addEventListener(Event.CHANGE,this.§_-J2N§);
            this.data.§_-yA§(_loc3_);
            _loc1_++;
         }
         var _loc2_:§_-22v§ = new §_-22v§(3,2,0,0,3,0,60,60);
         _loc2_.y = 190;
         _loc2_.setData(this.data);
         addChild(_loc2_);
         this.§_-C1K§ = new §_-x22§(this.§_-A1t§);
         this.§_-C1K§.addEventListener(§_-x22§.§_-Xg§,this.§_-11A§);
         addChild(this.§_-C1K§);
      }
      
      private function §_-J2N§(param1:Event = null) : void
      {
         if(this.§_-Dl§)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-O1i§();
         this.§_-C1K§.§_-Lu§ = _loc2_;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-11A§(param1:Event) : void
      {
         if(!this.§_-O1i§())
         {
            return;
         }
         if(this.§_-jS§)
         {
            return;
         }
         §_-k1C§.§_-vr§(this.§_-A1t§);
         this.§_-jS§ = true;
      }
   }
}

