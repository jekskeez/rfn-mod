package §_-Rj§
{
   import protocol.§_-P1h§;
   import utils.StringUtil;
   
   public class §_-g1L§
   {
      
      public var number:int;
      
      public var location:int;
      
      public var §_-H26§:int;
      
      public var mode:int;
      
      public var §_-i1v§:int;
      
      public var map:String;
      
      public var time:int;
      
      public var §_-L2R§:int;
      
      public var §_-B8§:int;
      
      public var §_-jm§:int;
      
      public var §_-t1m§:int;
      
      public var §_-mr§:int;
      
      public function §_-g1L§()
      {
         super();
         this.reset();
      }
      
      public function reset() : void
      {
         this.number = -1;
         this.mode = 0;
         this.§_-i1v§ = -1;
         this.map = "";
         this.time = 0;
      }
      
      public function §_-a14§(param1:§_-g1L§) : Boolean
      {
         return this.number == param1.number && this.location == param1.location && this.§_-H26§ == param1.§_-H26§ && this.mode == param1.mode && this.map == param1.map && this.time == param1.time;
      }
      
      public function copy(param1:§_-g1L§) : void
      {
         this.location = param1.location;
         this.§_-H26§ = param1.§_-H26§;
         this.mode = param1.mode;
         this.map = param1.map;
         this.time = param1.time;
         this.number = param1.number;
      }
      
      public function load(param1:Array) : void
      {
         this.mode = param1[0];
         this.§_-i1v§ = param1[1];
         this.time = param1[2];
         this.map = StringUtil.§_-B1K§(param1[3]);
         this.§_-L2R§ = param1[4];
         this.§_-B8§ = param1[5];
         this.§_-jm§ = param1[6];
         this.§_-t1m§ = param1[7];
         this.§_-mr§ = param1[8];
         §_-P1h§.add(param1[3]);
      }
   }
}

